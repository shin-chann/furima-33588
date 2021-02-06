FactoryBot.define do
  factory :purchase_residence do
    postal { '123-4567' }
    area_id { 1 }
    city { '新宿' }
    address { '歌舞伎町' }
    phone { '09000000000' }
    token { '123' }
  end
end
