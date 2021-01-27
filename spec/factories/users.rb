FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 6) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name_cc          { 'あいう' }
    first_name_cc         { 'あいう' }
    last_name_kana        { 'アイウ' }
    first_name_kana       { 'アイウ' }
    birthday              { '1990-01-01' }
  end
end
