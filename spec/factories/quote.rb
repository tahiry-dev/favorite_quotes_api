FactoryBot.define do
    factory :item do
      author { Faker::Internet.name }
      description { Faker::Internet.name }
    end
end