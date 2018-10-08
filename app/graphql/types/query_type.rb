Types::QueryType = GraphQL::ObjectType.define do
	name 'Query'

	field :questions, !types[Types::QuestionType] do
		resolve -> (obj, args, ctx) { Question.all }
	end

	field :categories, !types[Types::CategoryType] do
		resolve -> (obj, args, ctx) { Category.all }
	end

end
