# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Utilisation de la gem faker
require 'faker'

# On supprime les données en base
User.destroy_all
Pin.destroy_all
Comment.destroy_all

# On insère 5 users
5.times do
	User.create(username: Faker::Internet.username(8), email: Faker::Internet.email)
end
puts "5 users ont été insérés"

# On créé 10 pins qu'on associé aléatoirement à des users
10.times do 
	Pin.create(url: Faker::Internet.url, user: User.order("RANDOM()").first)
end	
puts "10 pins ont été insérés"

# On créé 50 commentaires qu'on associé aléatoirement à des users et à des pins
50.times do 
	Comment.create(content: Faker::HarryPotter.quote, pin: Pin.order("RANDOM()").first , user: User.order("RANDOM()").first )
end	
puts "50 commentaires ont été insérés"


