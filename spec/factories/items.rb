FactoryBot.define do
  factory :item do
    image         {Faker::Lorem.sentence}
    title          {"名前"}
    explanation    {"説明"}
    price           {2000}
    category_id     {2}
    item_state_id         {2}
    delivery_charge_id      {2}
    place_id         {2}
    delivery_date_id        {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
