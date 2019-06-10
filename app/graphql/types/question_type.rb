Types::QuestionType = GraphQL::ObjectType.define do
	name 'Question'

	field :name, !types.String
	field :category, -> { Types::CategoryType }
	field :answers, -> { !types[Types::AnswerType] }
end
