require 'rails_helper'

RSpec.describe Rubric, type: :model do
	it { is_expected.to be_mongoid_document }
	it { is_expected.to have_timestamps.for(:creating) }
	it { is_expected.to have_timestamps.for(:updating) }

	it { is_expected.to have_field(:unit_score).of_type(Integer) }
	it { is_expected.to have_field(:pass_deduction).of_type(Integer).with_default_value_of(0) }
	it { is_expected.to belong_to(:category) }

	it { is_expected.to validate_presence_of(:name).on(:create) }  	
	it { is_expected.to validate_presence_of(:unit_score).on(:create) }
	it { is_expected.to validate_uniqueness_of(:name).case_insensitive.with_message("already exists")}	
end
