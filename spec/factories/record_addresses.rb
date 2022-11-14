FactoryBot.define do
  factory :record_address do
    post_code                     { "123-1234" }
    prefecture_id                 { "2" }
    city                          { Faker::Address.city }
    address                       { Faker::Address.secondary_address }
    phone_number                  { "1234567890" }
    token                         { "tok_abcdefghijk00000000000000000" }
    user_id                       { "9999" }
    product_id                    { "9999" }
  end
end
