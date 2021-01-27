class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :name
    validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字混合での入力が必須である' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角（漢字・ひらがな・カタカナ）での入力が必須である' } do
    validates :first_name_cc
    validates :last_name_cc
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）での入力が必須である' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
