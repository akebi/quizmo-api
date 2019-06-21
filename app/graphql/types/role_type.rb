Types::RoleType = GraphQL::ObjectType.define do
	name 'Role'

	field :name, !types.String
end
