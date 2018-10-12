class Resolvers::CreateQuestion < GraphQL::Function
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
		
		raise GraphQL::ExecutionError.new "Multiple answers flagged as correct, question may only have one correct answer" unless only_one_correct?(args[:answers])
		args[:answers].each { |answer| question.answers.create!(name: answer[:name], correct: answer[:correct]) }
		
		question
	end

end
