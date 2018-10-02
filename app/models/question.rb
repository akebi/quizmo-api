class Question
	include Mongoid::Document
	include Mongoid::Timestamps::Created
	include Mongoid::Timestamps::Updated

	validates :name, presence: true

	field :name, type: String

	belongs_to :category
	embeds_many :answers

end
