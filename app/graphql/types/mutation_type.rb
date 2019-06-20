# Types::MutationType = GraphQL::ObjectType.define do
# 	name 'Mutation'

# 	field :questionCreate, function: Resolvers::QuestionCreate.new
# 	field :categoryCreate, function: Resolvers::CategoryCreate.new
# 	# field :rubricCreate, function: Resolvers::RubricCreate.new
# 	field :create_user, mutation: Mutations::CreateUser

# end

module Types
	class MutationType < Types::BaseObject
		field :questionCreate, function: Resolvers::QuestionCreate.new
		field :categoryCreate, function: Resolvers::CategoryCreate.new
		# field :rubricCreate, function: Resolvers::RubricCreate.new
		field :user_create, mutation: Mutations::UserCreate
		field :user_log_in, mutation: Mutations::UserLogIn
	end
  end
