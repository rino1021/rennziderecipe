Admin.create(
   email: 'admin@admin',
   password: 'testtest'
)

User.create!(#username:  "管理者",
             email: "admin@admin",
             password:  "testtest",
             password_confirmation: "testtest",
             admin: true)

#  times do |n|
#  name  = Faker::Name.name
#  email = "admin-#{n+1}@admin"
#  password = "testtest"
#  User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
