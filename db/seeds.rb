# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

31.times do |n|
  name = Faker::Creature::Cat.name
  email = Faker::Internet.email
  password = "password"
  uid =Faker::Internet.public_ip_v4_address
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               uid: uid,
               )
end

30.times do |n|
  title = Faker::BossaNova.name
  date = Faker::Date.in_date_period
  Diary.create!(title: title,
                content: "sample_cintent",
                activity_date: date,
                user_id: 40,
                )
end
