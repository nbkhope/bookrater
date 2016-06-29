Review.delete_all
Book.delete_all
User.delete_all

# Generate fake users
30.times do 
	user = User.create!(
		username: Faker::Internet.user_name,
		email: Faker::Internet.email,
		password: "123456",#Faker::Internet.password,
	)
end

# Generate fake books
100.times do 
	book = Book.create!(
		title: Faker::Book.title,
		author: Faker::Book.author,
		summary: Faker::Lorem.paragraph,
		cover: "images/fake_book_cover" + ["", "2"].sample + ".png"
	)

	# Generate fake reviews
	rand(0..5).times do 
		Review.create!(
			content: Faker::Lorem.paragraph,
			rating: rand(1..5),
			user: User.all.sample,
			book: book,
		)
	end
end

User.all.each do |user|
	# Add favorite books to each user
	rand(0..10).times do
		Favorite.create!(
			user: user,
			book: Book.all.sample,
		)
	end

	# Generate fake likes for reviews
	rand(0..10).times do
		Like.create!(
			user: user,
			review: Review.all.sample,
		)
	end
end
