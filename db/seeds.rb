# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin", email: "admin@test.com", password: "password", status: 1, present: "0")
User.create(name: "user", email: "user@test.com", password: "password", status: 2, present: "0")
User.create(name: "part-time", email: "part@test.com", password: "password", status: 3, present: "0")
