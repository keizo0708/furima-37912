FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    county_id     { 2 }
    city          { '札幌市' }
    address       { '1-1' }
    building      { '札幌ハイツ' }
    tell          { '09012342000' }
    token         { '00000000000' }
  end
end
