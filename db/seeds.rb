require 'faker'

5.times do 
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10))
  user.skip_confirmation!
  user.save!
end

users = user.all


50.times do 
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

100.times do 
  Comment.create!(
    # user: users.samle,
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
  
end

user = User.first
user.skip_reconfirmationa!
user.update_attributes!(
  email: 'matthkg852@gmail.com'
  password: 'jj123123')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
