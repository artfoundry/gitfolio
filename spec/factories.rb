require 'faker'

FactoryGirl.define do
  factory :developer do
    github_username { Faker::Name.last_name }

    factory :developer_with_projects do
      after(:create) do |developer|
        FactoryGirl.create_list(:project, rand(1..10), developer: developer)
      end
    end

  end

  factory :project do
    title { Faker::Company.name }
    developer
  end

end
