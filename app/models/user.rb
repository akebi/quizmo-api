class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :role, type: String

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
