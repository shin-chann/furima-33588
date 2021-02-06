require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_residence,user_id: @user.id , item_id: @item.id)
    sleep 0.5
  end

  context '商品購入ができる場合' do
    it '必要な情報を適切に入力すると、商品の購入ができること' do
      expect(@purchase).to be_valid
    end
  end

  context '商品購入ができない場合' do
    it 'user_idが空では出品できないこと' do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では購入できないこと' do
      @purchase.item_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Item can't be blank")
    end

    it 'tokenが空では購入できないこと' do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end

    it 'postalが空では購入できないこと' do
      @purchase.postal = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal can't be blank", "Postal is invalid")
    end

    it 'postalがハイフンがないと購入できないこと' do
      @purchase.postal = '1111111'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal is invalid")
    end

    it 'postalが6文字以下では購入できないこと' do
      @purchase.postal = '111-111'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal is invalid")
    end

    it 'postalが8文字以上では購入できないこと' do
      @purchase.postal = '1111-1111'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal is invalid")
    end

    it 'area_idが0では購入できないこと' do
      @purchase.area_id = 0
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Area must be other than 0')
    end

    it 'cityが空では購入できないこと' do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では購入できないこと' do
      @purchase.address = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Address can't be blank")
    end

    it 'phoneが空では購入できないこと' do
      @purchase.phone = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone can't be blank", "Phone 半角数字での入力が必須である", "Phone is invalid")
    end

    it 'phoneが11桁以上では購入できないこと' do
      @purchase.phone = '111111111111'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone is invalid")
    end

    it 'phoneが英数混合では購入できない' do
      @purchase.phone = 'a11111111111'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone is invalid")
    end
  end
end

