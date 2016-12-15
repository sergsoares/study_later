# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:  "Sergio",
             email: "acad.sergio@gmail.com",
             password:              "123456",
             password_confirmation: "123456")

User.create(name:  "Jera User",
             email: "jera@gmail.com",
             password:              "123456",
             password_confirmation: "123456")

100.times do
	Link.create(title:  Faker::Educator.course,
				link: Faker::Internet.url,
				category: "learn",
				user_id: 1)

	Link.create(title:  Faker::Educator.course,
				link: Faker::Internet.url,
				category: "learn",
				user_id: 2)
end