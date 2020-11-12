FactoryBot.define do
  factory :item do
    title                {Faker::Lorem.characters(number: 10)}
    introduction         {Faker::Lorem.sentence}
    category_id          {Faker::Number.between(from: 2, to: 12)}
    status_id            {Faker::Number.between(from: 2, to: 7)}
    delivery_fee_id      {Faker::Number.between(from: 2, to: 3)}
    prefecture_id        {Faker::Number.between(from: 2, to: 48)}
    delivery_time_id     {Faker::Number.between(from: 2, to: 4)}
    price                {Faker::Number.between(from: 300, to: 999999)}
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
