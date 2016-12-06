# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "example user",
email: "example@nom.org",
password: "foobar",
password_confirmation: "foobar",
admin: true,
activated: true)

99.times do |n|
  name = Faker::Name.name
  email ="agogol-#{n+1}@aol.com"
  password ="password"
  User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password,
  activated: true
  #activated_at: Time.zone.now
  )
end

users= User.order( :created_at).take(5)
50.times do
  content =Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content)}
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
