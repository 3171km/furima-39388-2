FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    sur_name              { '山田' }
    name                  { '陸太郎' }
    sur_name_katakana     { 'ヤマダ' }
    name_katakana         { 'リクタロウ' }
    birth_day             { Faker::Date.backward }
  end
end