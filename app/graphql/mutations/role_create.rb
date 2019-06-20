module Mutations
	class RoleCreate < BaseMutation
	  argument :name, String, required: true

	  type Types::RoleType

	  def resolve(name: nil)
		Role.create!(
		  name: name,
		)
	  end
	end
  end
