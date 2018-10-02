class Category
  include Mongoid::Document

  validates :name, presence: true

  field :name, type: String
  
  has_one :rubric
  has_many :questions

end
