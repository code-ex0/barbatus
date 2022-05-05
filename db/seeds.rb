# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p "0. Destroying all data"

Following.destroy_all
Tweet.destroy_all
User.destroy_all
Favorite.destroy_all


p "1. Creating users..."

User.create(username: "code_ex", handle: "code_ex", email: "louis@gmail.com", password: "123456", password_confirmation: "123456", confirmed_at: Time.now)
100.times do
  name = Faker::Twitter.screen_name
  User.create(username: name , handle: name, email: "#{name}@mail.com", password: '123456', password_confirmation: '123456', confirmed_at: Time.now)
end

p "2. Creating tweets..."

10000.times do
  Tweet.create(user_id: rand(1..100), text: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 4))
end

p "3. Creating followings..."

followed = 1
100.times do
  follower = (1..100).to_a.shuffle
  indexpos = 0
  rand(5..100).times do
    Following.create(followed_id: followed, follower_id: follower[indexpos])
    indexpos += 1
  end
  followed += 1
end

p "4 Creating likes..."

100.times do
  user = (1..100).to_a.shuffle
  tweet = (1..10000).to_a.shuffle
  Favorite.create(user_id: user[0], tweet_id: tweet[0])
end