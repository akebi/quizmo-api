Inputs::AnswerInput = GraphQL::InputObjectType.define do
	name 'AnswerInput'

	argument :name, !types.String
	argument :correct, !types.Boolean
end
