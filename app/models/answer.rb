class Answer < ActiveRecord::Base
	validates :name, presence: true
	validates :correct, presence: true

end
