# Data can then be loaded with `rake db:seed`, created alongside the db with `rake db:setup` or recreated with `rake db:reset`

require 'faker'

mcq_rubric = Rubric.create!(name: 'mcq', unit_score: 20 , pass_deduction: 10)
open_rubric = Rubric.create!(name: 'open', unit_score: 40, pass_deduction: 20)

mcq = Category.create!(name: 'mcq', rubric: mcq_rubric)
open = Category.create!(name: 'open', rubric: open_rubric) 

20.times do
	answers = Array.new
	4.times { answers << { name: Faker::DrWho.catch_phrase, correct: Faker::Boolean.boolean(0.25) } }
	question = Question.create!(name: Faker::ChuckNorris.fact, answers: answers)	
	question.category = mcq	
end

20.times do
	answers = [ { name: Faker::GameOfThrones.dragon, correct: true } ]
	question = Question.create!(name: Faker::FamousLastWords.last_words, answers: answers)	
	question.category = open	
end
