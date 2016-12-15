# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sergio = User.create(name:  "Sergio",
             email: "acad.sergio@gmail.com",
             password:              "123456",
             password_confirmation: "123456")

jera = User.create(name:  "Jera User",
             email: "jera@gmail.com",
             password:              "123456",
             password_confirmation: "123456")

Category.create(name: "learn",
	            user_id: sergio.id)
Category.create(name: "programming",
	            user_id: sergio.id)
Category.create(name: "teory",
	            user_id: sergio.id)

Category.create(name: "learn",
	            user_id: jera.id)
Category.create(name: "programming",
	            user_id: jera.id)
Category.create(name: "teory",
	            user_id: jera.id)

200.times do
	Link.create(title:  Faker::Educator.course,
				link: Faker::Internet.url,
				category_id: rand(1..3),
				user_id: sergio.id)

	Link.create(title:  Faker::Educator.course,
				link: Faker::Internet.url,
				category_id: rand(4..6),
				user_id: jera.id)
end