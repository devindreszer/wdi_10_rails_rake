337.times do |i|
  User.create!(name: Faker::Name.name, email: Faker::Internet.email)
end
