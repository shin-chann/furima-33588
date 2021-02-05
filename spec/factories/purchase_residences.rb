FactoryBot.define do
  factory :purchase_residence do
    postal { '123-4567' }
    area_id { 1 }
    city { '新宿' }
    address { '歌舞伎町' }
    phone { '09000000000' }
    user_id { '名前' }
    item_id { '商品' }
    token { '123' }
  end
end
