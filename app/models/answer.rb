#class Answer < ActiveRecord::Base
class Answer
	include Mongoid::Document
	include Mongoid::Timestamps::Created
	include Mongoid::Timestamps::Updated

	validates :name, presence: true
	validates :correct, presence: true

	field :name, type: String
	field :correct, type: Boolean, default: false
	embedded_in :question

end
