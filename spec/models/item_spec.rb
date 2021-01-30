require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
  

    context "商品出品ができる場合" do
      it "必要な情報を適切に入力すると、商品の出品ができること" do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'product_nameが空では出品できないこと' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'explanationが空では出品できないこと' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'category_idが0では出品できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it 'state_idが0では出品できないこと' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 0")
      end

      it 'burden_idが0では出品できないこと' do
        @item.burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end

      it 'area_idが0では出品できないこと' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end

      it 'number_of_time_idが0では出品できないこと' do
        @item.number_of_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of time must be other than 0")
      end

      it 'priceが299円以下では出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが10,000,000円以上では出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが半角数字でなければ出品できないこと' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "ユーザーが紐付いていないと商品は出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
end
