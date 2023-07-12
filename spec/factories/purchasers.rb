FactoryBot.define do
  factory :purchaser do
    zip_code  { '123-4567' }
    region_id { 2 }
    city      { 'aあア亜' }
    address1  { '市町1-0-1' }
    address2  { '東京プラッツ' }
    telephone { '09012345678' }
    token     { 'tok_abcdefghijk00000000000000000' }
  end
end
