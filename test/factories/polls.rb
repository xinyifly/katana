FactoryBot.define do
  factory :poll do
    name { Faker::Internet.slug }
  end
end
