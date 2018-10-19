Types::MutationType = GraphQL::ObjectType.define do
	name 'Mutation'

	field :questionCreate, function: Resolvers::QuestionCreate.new

end
