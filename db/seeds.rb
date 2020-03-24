user_1 = User.create(email: 'user1@test.com', password: 'password', password_confirmation: 'password')
user_2 = User.create(email: 'user2@test.com', password: 'password', password_confirmation: 'password')

language_1 = Language.create(name: 'English')
language_2 = Language.create(name: 'Polish')
language_3= Language.create(name: 'English')

5.times do
 word = Word.create(content: Faker::Lorem.word, language: language_1, user: user_1 )
 translation_1 = Word.create(content: Faker::Lorem.word, language: language_2, user: user_1 )
 translation_2 = Word.create(content: Faker::Lorem.word, language: language_2, user: user_1 )
 word.translations << [translation_1, translation_2]
end
5.times do
 Word.create(content: Faker::Lorem.word, language: language_2, user: user_2 )
 Word.create(content: Faker::Lorem.word, language: language_2, user: user_2 )
end