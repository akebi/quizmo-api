class Resolvers::QuestionCreate < GraphQL::Function
	argument	:name, !types.String
	argument :category, !types.String
	argument :answers, !types[Inputs::AnswerInput]

	type Types::QuestionType


	def only_one_correct?(answers)
		num_correct = 0
		answers.each { |answer| num_correct += 1 if answer[:correct] }
		num_correct == 1
	end	

	def call(_obj, args, _ctx)
		question = Question.create!(name: args[:name],
											 category: Category.find_by(name: args[:category]))
		
		raise GraphQL::ExecutionError.new(AnswersHelper::Errors.MORE_THAN_ONE_CORRECT_ANSWER) unless only_one_correct?(args[:answers])
		args[:answers].each { |answer| question.answers.create!(name: answer[:name], correct: answer[:correct]) }

		question

	rescue Mongoid::Errors::Validations => err
		raise GraphQL::ExecutionError.new(QuestionsHelper::Errors.INVALID_INPUT + err.message)

	# TODO: handle category not found error

	end

end
