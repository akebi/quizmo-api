require 'rails_helper'

RSpec.describe Category, type: :model do
	it { is_expected.to be_mongoid_document }

	it { is_expected.to have_field(:name).of_type(String) }
	it { is_expected.to have_one(:rubric) }
	it { is_expected.to have_many(:questions) }

	it { is_expected.to validate_presence_of(:name).on(:create) }

end
