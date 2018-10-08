Types::MutationType = GraphQL::ObjectType.define do
	name 'Mutation'

	field :createQuestion, function: Resolvers::CreateQuestion.new

end
