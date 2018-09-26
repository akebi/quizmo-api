class Question < ActiveRecord::Base
	validates :name, presence: true

	has_one :score
	has_many :answers

end
