class Resolvers::CategoryCreate < GraphQL::Function
	argument :name, !types.String
	argument :rubric, !types.String

	type Types::CategoryType

	def call(_obj, args, _ctx)
		Category.new(name: args[:name], 
						 rubric: Rubric.find_by(name: args[:rubric]))

	rescue Mongoid::Errors::Validations => err
		raise GraphQL::ExecutionError.new(CategoriesHelper::Errors.INVALID_INPUT + err.message)

	# TODO: handle rubric not found error	

	end

end
