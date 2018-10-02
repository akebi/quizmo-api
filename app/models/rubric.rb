class Rubric
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  validates :name, presence: true, uniqueness: { case_sensitive: false, 
																message: "already exists" }
  validates :unit_score, presence: true

  field :name, type: String
  field :unit_score, type: Integer							#=> score per question in category
  field :pass_deduction, type: Integer, default: 0 	#=> points deducted fron unit score on pass

  belongs_to :category

end
