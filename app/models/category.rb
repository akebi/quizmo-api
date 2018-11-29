class Category
  include Mongoid::Document

  validates :name, presence: true, uniqueness: { case_sensitive: false, 
																message: "already exists" }

  field :name, type: String
  
  has_one :rubric
  has_many :questions

end
