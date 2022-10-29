FactoryBot.define do
  factory :product do
    name                  { Faker::Name.initials(number: 2) }
    explanation           { Faker::Lorem.sentence(word_count: 15) }
    category              { Category.where(id: 2..11).sample }
    status                { Status.where(id: 2..4).sample }
    postage               { Postage.where(id: 2..3).sample }
    prefecture            { Prefecture.where(id: 2..48).sample }
    days_to_ship          { DaysToShip.where(id: 2..7).sample }
    price                 { Faker::Number.between(from: 300, to: 9999999) }
    association :user                  

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
