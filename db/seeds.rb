# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.find_or_initialize_by(email: 'pintookewat88@gmail.com')
user.full_name = 'Pintoo kewat'
user.password = 'password'
user.password_confirmation = 'password'
user.gender = "Male"
user.phone = 6266456544
user.age = 22
user.add_role :super_admin
user.save!
