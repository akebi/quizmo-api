Types::CategoryType = GraphQL::ObjectType.define do
	name 'Category'

	field :name, !types.String
	field :rubric, -> { !Types::RubricType }
	field :questions, -> { !types[Types::QuestionType] }
end

