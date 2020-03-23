# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user_1 = User.create(email: 'user1@test.com', password: 'password', password_confirmation: 'password')
user_2 = User.create(email: 'user2@test.com', password: 'password', password_confirmation: 'password')

language_1 = Language.create(name: 'English')
language_2 = Language.create(name: 'Polish')
language_3= Language.create(name: 'English')

5.times do
 Word.create(content: Faker::Lorem.word, language: language_1, user: user_1 )
 Word.create(content: Faker::Lorem.word, language: language_2, user: user_1 )
end

5.times do
 Word.create(content: Faker::Lorem.word, language: language_2, user: user_2 )
 Word.create(content: Faker::Lorem.word, language: language_2, user: user_2 )
end