class Resolvers::CreateQuestion < GraphQL::Function
	argument	:name, !types.String
	argument :category, !types.String
	argument :answers, !types[Inputs::AnswerInput]

	type Types::QuestionType

	def call(_obj, args, ctx)
		question = Question.create!(name: args[:name],
											 category: Category.find_by(name: args[:category]))
		
		args[:answers].each do |answer|
			question.answers.create!(name: answer.name, correct: answer.correct)
		end

		question
	end

end
