# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Clear existing data
# Like.destroy_all
# Post.destroy_all
# User.destroy_all

user1 = User.create!(
  email: 'user1@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

user2 = User.create!(
  email: 'user2@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

post1 = Post.create!(
  title: 'First Post',
  content: 'This is the content of the first post.',
  user: user1
)

post2 = Post.create!(
  title: 'Second Post',
  content: 'This is the content of the second post.',
  user: user2
)

post3 = Post.create!(
  title: 'Third Post',
  content: 'This is the content of the third post.',
  user: user1
)

Like.create!(user: user1, post: post2)
Like.create!(user: user2, post: post1)
Like.create!(user: user1, post: post3)

puts "Seeding completed successfully!"
