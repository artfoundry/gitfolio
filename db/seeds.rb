# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "faker"

100.times do
  dev = Developer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    github_username: Faker::Internet.user_name
    )

  rand(10).times do
    dev.projects.create(
      title: Faker::Company.name,
      url: Faker::Internet.domain_name,
      description: Faker::Lorem.paragraph
      )
  end

end
