Types::QueryType = GraphQL::ObjectType.define do
	name 'Query'

	field :allQuestions, !types[Types::QuestionType] do
		resolve -> (obj, args, ctx) { Question.all }
	end

	field :allCategories, !types[Types::CategoryType] do
		resolve -> (obj, args, ctx) { Category.all }
	end

end
