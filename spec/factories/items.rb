FactoryBot.define do
  factory :item do
    title                    { Faker::Lorem.sentence } 
    overview                 { Faker::Lorem.sentence }
    category_id              { Faker::Number.between(from: 2, to: 11) }
    status_id                { Faker::Number.between(from: 2, to: 11) }
    burden_id                { Faker::Number.between(from: 2, to: 11) }
    region_id                { Faker::Number.between(from: 2, to: 11) }
    shipment_id              { Faker::Number.between(from: 2, to: 11) }
    price                    { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    end
    end