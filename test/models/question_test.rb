require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
	test "should not save question without name" do
		question = Question.new
		assert_not question.save, "Question saved without name"
	end

end
