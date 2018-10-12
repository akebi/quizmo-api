require 'rails_helper'

RSpec.describe Resolvers::CreateQuestion do
 	subject(:new_question) { described_class.new.call(_obj, args, _ctx) }

	let(:_obj) { {} }
	let(:_ctx) { {} }

	context "valid input for question fields" do
		
		let(:args) do 
			{ name: "What was the first planet to be discovered using the telescope, in 1781?",
	  			category: "mcq",
				answers: [{ name: "Pluto", correct: false },
				 				{ name: "Uranus", correct: true },
								{ name: "Pluto", correct: false },
								{ name: "Jupiter", correct: false }]
			}
		end

		it "creates question with all fields set" do
			expect(new_question.name).to eq(args[:name])
			expect(new_question.category.name).to eq(args[:category])
		end
	
	end

	context "invalid input for question fields" do
		let(:args) do 
			{ name: "What was the first planet to be discovered using the telescope, in 1781?",
	  			category: "mcq",
				answers: [{ name: "Pluto", correct: false },
				 				{ name: "Uranus", correct: true },
								{ name: "Pluto", correct: false },
								{ name: "Jupiter", correct: true }]
			}
		end

		it "throws error if more than one answer is correct" do
			expect { new_question }.to raise_error(GraphQL::ExecutionError) 
		end
		
	end
end
