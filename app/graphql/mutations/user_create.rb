module Mutations
  class UserCreate < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    class AuthProviderSignupData < Types::BaseInputObject
      argument :email, Types::AuthProviderEmailInput, required: false
    end

    argument :username, String, required: true
    argument :full_name, String, required: true
    argument :role, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::UserType

    def resolve(username: nil, full_name: nil, auth_provider: nil, role: nil)
      User.create!(
        username: username,
        full_name: full_name,
        role: role,
        email: auth_provider&.[](:email)&.[](:email),
        password: auth_provider&.[](:email)&.[](:password)
      )
    end
  end
end
