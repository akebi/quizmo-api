require 'rails_helper'

RSpec.describe Question, type: :model do
	it { is_expected.to be_mongoid_document }
	it { is_expected.to have_timestamps.for(:creating) }
	it { is_expected.to have_timestamps.for(:updating) }

	it { is_expected.to have_field(:name).of_type(String) }
	it { is_expected.to belong_to(:category) }
	it { is_expected.to embed_many(:answers) }

	it { is_expected.to validate_presence_of(:name).on(:create) }
	
end
