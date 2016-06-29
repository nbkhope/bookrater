# You have to require rails_helper, not spec_helper!
require 'rails_helper'

describe User, type: :model do

	# test that the user responds to auth_token attribute
	it { should respond_to(:auth_token) }

	# test that the user's auth_token is unique
	it { should validate_uniqueness_of(:auth_token) }

	describe "#generate_authentication_token!" do
		it "generates a unique token" do

		end

		it "generates another token when one has already been taken" do

		end
	end

end
