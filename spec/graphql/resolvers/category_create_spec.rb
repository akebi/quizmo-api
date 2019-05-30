require 'rails_helper'

RSpec.describe Resolvers::CategoryCreate do
	subject(:new_category) { described_class.new.call(_obj, args, _ctx) }

	let(:_obj) { {} }
	let(:_ctx) { {} }

	context "valid input for all category fields" do
		let(:args) do
			{ name: "all-or-nothing",
	  			rubric: "open"
			}
		end

		it "creates category with all fields set" do
			expect(new_category.name).to eq(args[:name])
			expect(new_category.rubric.name).to eq(args[:rubric])
		end
	end

	context "invalid input for category" do
		let(:args) do
		{ name: "all-or-nothing",
	  		rubric: "unknown"
		}
		end

		it "throws error if named rubric does not exist" do
			expect { new_category }.to raise_error(GraphQL::ExecutionError)			
		end
 
	end

	context "null input for required category name field" do
		let(:args) do
			{ name: "",
	  			rubric: "open"
			}
		end

		it "throws error if category name is null" do
			expect { new_category }.to raise_error(GraphQL::ExecutionError)
		end
	end

	# TODO: add existing category
end
