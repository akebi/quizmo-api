Types::AnswerType = GraphQL::ObjectType.define do
	name 'Answer'

	field :name, !types.String
	field :correct, !types.Boolean
	field :question, -> { Types::QuestionType }
end
