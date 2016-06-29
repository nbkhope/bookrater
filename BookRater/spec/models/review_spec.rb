require 'rails_helper'

describe Review, type: :model do

	# attributes
	it { should respond_to(:content) }
	it { should respond_to(:rating) }
	#it { should validate_presence_of(:user) }
	#it { should validate_presence_of(:book) }

end
