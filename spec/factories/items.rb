FactoryBot.define do
  factory :item do
    
    product_name           { "商品" }
    explanation            { "説明" }
    category_id            { 1 }
    state_id               { 1 }
    burden_id              { 1 }
    area_id                { 1 }
    number_of_time_id      { 1 }
    price                  { 500 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
