class Question
	include Mongoid::Document
	include Mongoid::Timestamps::Created
	include Mongoid::Timestamps::Updated

	validates :name, presence: true, uniqueness: { case_sensitive: false, 
																message: "already exists" }


	field :name, type: String

	belongs_to :category
	embeds_many :answers

end
