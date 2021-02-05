class PurchaseResidence

  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal
    validates :city
    validates :address
    validates :phone
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }

  validates :phone, format: { with: /\A[0-9]+\z/, message: '半角数字での入力が必須である' }

  # phone 11桁のvalidates
  validates :phone, format: { with: /\A\d{11}\z/ }

  with_options numericality: { other_than: 0 } do
    validates :area_id
  end
  #validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Residence.create(postal: postal,area_id: area_id, city: city, address: address, building: building, phone: phone, purchase_id: purchase.id)
  end
end