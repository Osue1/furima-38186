FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                    { Faker::Name.initials(number: 2) }
    email                       { Faker::Internet.free_email }
    password                    { Faker::Internet.password(min_length: 6) }
    password_confirmation       { password }
    last_name                   { person.first.kanji }
    first_name                  { person.last.kanji }
    last_name_reading           { person.first.katakana }
    first_name_reading          { person.last.katakana }
    birthday                    { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
