# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

City.destroy_all
User.destroy_all
Tag.destroy_all
Gossip.destroy_all

10.times do |index|
  City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip)
end

10.times do |index|
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.matz, email: Faker::Internet.email, age: Faker::Number.between(from: 1, to: 101), city: City.all.sample)
end

10.times do |index|
  Tag.create!(title: Faker::Book.genre)
end

20.times do |index|
  Gossip.create!(title: Faker::Book.title, content: Faker::Quote.famous_last_words, user: User.all.sample)
end

Gossip.all.each do |g| 

  h = 1

  while h == 1

    t = Tag.all.sample
    g.tags << t if !g.tags.include?(t)
    h = [1, 2, 1].sample
  end
end