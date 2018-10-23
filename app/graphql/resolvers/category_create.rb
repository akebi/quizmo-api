class Resolvers::CategoryCreate < GraphQL::Function
	argument :name, !types.String
	argument :rubric, !types.String

	type Types::CategoryType

	def call(_obj, args, _ctx)
		category = Category.create!(name: args[:name]) 
		category.rubric = Rubric.find_by(name: args[:rubric])

		category

	rescue Mongoid::Errors::Validations => err
		raise GraphQL::ExecutionError.new(CategoriesHelper::Errors.INVALID_INPUT + err.message)

	# TODO: handle rubric not found error	

	end

end
