FactoryBot.define do
  factory :rule do
    poll
    key { Rule.keys.values.sample }
    value { Faker::Internet.slug }
  end
end
