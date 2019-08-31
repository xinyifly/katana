FactoryBot.define do
  factory :rule do
    poll
    key { Faker::Internet.slug }
    value { Faker::Internet.slug }
  end
end
