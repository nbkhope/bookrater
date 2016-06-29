# You have to require rails_helper, not spec_helper!
require 'rails_helper'

describe User, type: :model do

	# test that the user responds to auth_token attribute
	it { should respond_to(:auth_token) }

	# test that the user's auth_token is unique
	it { should validate_uniqueness_of(:auth_token) }

	# describe "#generate_auth_token" do
	# 	it "generates a unique token" do
	# 		#Devise.stub(:friendly_token).and_return("auniquetoken123")
	# 		@user.generate_auth_token
	# 		expect(@user.auth_token).to eql "auniquetoken123"
	# 	end

	# 	it "generates another token when one has already been taken" do
	# 		existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
	# 		@user.generate_authentication_token!
	# 		expect(@user.auth_token).not_to eql existing_user.auth_token
	# 	end
	# end

end
