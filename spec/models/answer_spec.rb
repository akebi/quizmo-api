require 'rails_helper'

RSpec.describe Answer, type: :model do
	it { is_expected.to be_mongoid_document }
	it { is_expected.to have_timestamps.for(:creating) }
	it { is_expected.to have_timestamps.for(:updating) }

	it { is_expected.to have_field(:name).of_type(String) }
	it { is_expected.to have_field(:correct).of_type(Boolean).with_default_value_of(false) }
	it { is_expected.to be_embedded_in(:question) }

	it { is_expected.to validate_presence_of(:name).on(:create) }
	it { is_expected.to validate_presence_of(:correct).on(:create) }

end
