Types::MutationType = GraphQL::ObjectType.define do
	name 'Mutation'

	field :questionCreate, function: Resolvers::QuestionCreate.new
	field :categoryCreate, function: Resolvers::CategoryCreate.new
	# field :rubricCreate, function: Resolvers::RubricCreate.new

end
