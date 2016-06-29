FactoryGirl.define do
	factory :user do
		username { FFaker::Internet.user_name } 
		email { FFaker::Internet.email } 
		password "123456"
	end
end
