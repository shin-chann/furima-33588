class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :number_of_time
  belongs_to :state
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :product_name
    validates :image
    validates :explanation
    validates :price
  end
  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
    validates :area_id
    validates :burden_id
    validates :category_id
    validates :number_of_time_id
    validates :state_id
  end

  # 価格の上限・下限(半角数字)
  validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字での入力が必須である' }
end
