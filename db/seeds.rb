# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Destroy all
Like.destroy_all
Comment.destroy_all
Article.destroy_all
Category.destroy_all
User.destroy_all

# Users create
20.times do |i|
  name = Faker::Name.first_name
  User.create(
      email:"#{name}@yopmail.com",
      password:"foobar",
      password_confirmation:"foobar"
  )
  puts "*"*(i+1)
  puts "#{i+1} user(s) created"
end


#Category
categories = ["Ruby", "Python", "JavaScript", "Java", "PHP"]
categories.each do |category|
  Category.create(
    name:category
  )
  puts "#{category} created"
end


# Article create
50.times do |i|
  Article.create(
      title:Faker::Movie.title,
      category_id:Category.all.sample.id,
      body:Faker::Movies::StarWars.quote,
      user_id:User.all.sample.id
  )
  puts "*"*(i+1)
  puts "#{i+1} Article(s) created"
end


# Comment create
50.times do |i|
  Comment.create(
      body:Faker::Movies::StarWars.quote,
      article_id:Article.all.sample.id,
      user_id:User.all.sample.id
  )
  puts "*"*(i+1)
  puts "#{i+1} Comment(s) created"
end

# Like create
100.times do |i|
  Like.create(
      article_id:Article.all.sample.id,
      user_id:User.all.sample.id
  )
  puts "*"*(i+1)
  puts "#{i+1} Like(s) created"
end