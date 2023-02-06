FactoryBot.define do
  factory :order_send_address do
    postal_code { '123-4567' }
    place_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    token {"tok_abcdefghijk00000000000000000"}
    telephone{ '00000000000' }
    item_id{ '3' }
  end
end
