require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
	test "should not save answer without name" do
		answer = Answer.new
		assert_not answer.save, "Answer saved without name"
	end

	test "should not save answer without correct/incorrect" do
		answer = Answer.new
		answer.name = "My first question"
		assert_not answer.save, "Answer saved without correct/incorrect"
	end

end
