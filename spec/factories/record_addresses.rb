FactoryBot.define do
  factory :record_address do
    post_code                     { '123-1234' }
    prefecture_id                 { '2' }
    city                          { Faker::Address.city }
    address                       { Faker::Address.secondary_address }
    building                      { Faker::Address.building_number }
    phone_number                  { '1234567890' }
    token                         { 'tok_abcdefghijk00000000000000000' }
  end
end
