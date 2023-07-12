FactoryBot.define do
  factory :shipping do
    zip_code        { '123-4567' }
    region_id       { 2 }
    city            { '東京都' }
    address1        { '1-1' }
    address2        { '東京プラッツ' }
    telephone       { '01234567890' }
  end
end