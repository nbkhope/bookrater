require 'rails_helper'

describe Book, type: :model do

	# attributes
	it { should respond_to(:title) }
	it { should respond_to(:author) }
	it { should respond_to(:summary) }
	it { should respond_to(:cover) }

end
