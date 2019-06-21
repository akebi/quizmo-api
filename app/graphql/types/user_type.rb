module Types
    class UserType < BaseObject
      field :id, ID, null: false
      field :full_name, String, null: false
      field :username, String, null: false
      field :email, String, null: false
      field :role, RoleType, null: false
    end
  end