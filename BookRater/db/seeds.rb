# Generate fake users
30.times do 
	user = User.create(
		username: Faker::Internet.user_name,
		email: Faker::Internet.email,
		password: "1",#Faker::Internet.password,
	)
end

# Generate fake books
100.times do 
	book = Book.create(
		title: Faker::Book.title,
		author: Faker::Book.author,
		summary: Faker::Lorem.paragraph,
		cover: "images/fake_book_cover" + ["", "2"].sample + ".png"
	)

	# Generate fake reviews
	rand(0..5).times do 
		Review.create(
			content: Faker::Lorem.paragraph,
			rating: rand(1..5),
			user: User.all.sample,
			book: book,
		)
	end
end

