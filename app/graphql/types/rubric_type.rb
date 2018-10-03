Types::RubricType = GraphQL::ObjectType.define do
	name 'Rubric'

	field :name, !types.String
	field :unit_score, !types.Int
	field :pass_deduction, !types.Int
	field :category, -> { Types::CategoryType }	
end
