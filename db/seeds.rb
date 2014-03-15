# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

people = 50.times.map do |i|
  {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: (Time.now - rand(18..80).years).to_s,
    carrier: Faker::Company.name,
    expected_amount_cents: rand(100..1000000)
  }
end

Customer.create(people)
