require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'nameが空では登録できないこと' do
    @user.name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Name can't be blank")
  end

  it 'emailが空では登録できないこと' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'emailは＠がないと登録できないこと' do
    @user.email = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it '重複したemailが存在する場合登録できないこと' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'passwordが空では登録できないこと' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'passwordが6文字以上であれば登録できること' do
    @user.password = '12345a'
    @user.password_confirmation = '12345a'
    expect(@user).to be_valid
  end

  it 'passwordが英数字混合であれば登録できること' do
    @user.password = '123aaa'
    @user.password_confirmation = '123aaa'
    expect(@user).to be_valid
  end

  it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'passwordとpassword_confirmationが不一致では登録できないこと' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'birthdayが空では登録できないこと' do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it 'first_name_ccが空では登録できないこと' do
    @user.first_name_cc = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name cc can't be blank")
  end

  it 'last_name_ccが空では登録できないこと' do
    @user.last_name_cc = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name cc can't be blank")
  end

  it 'first_name_kanaが空では登録できないこと' do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it 'last_name_kanaが空では登録できないこと' do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end

  it 'first_name_ccが全角入力でなければ登録できないこと' do
    @user.first_name_cc = FactoryBot.build(:user, first_name_cc: 'ｱｲｳｴｵ')
    @user.valid?
    expect(@user.errors[:first_name_cc]).to include('全角（漢字・ひらがな・カタカナ）での入力が必須である')
  end

  it 'last_name_ccが全角入力でなければ登録できないこと' do
    @user.last_name_cc = FactoryBot.build(:user, last_name_cc: 'ｱｲｳｴｵ')
    @user.valid?
    expect(@user.errors[:last_name_cc]).to include('全角（漢字・ひらがな・カタカナ）での入力が必須である')
  end

  it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
    @user.first_name_kana = FactoryBot.build(:user, first_name_kana: 'あいうえお')
    @user.valid?
    expect(@user.errors[:first_name_kana]).to include('全角（カタカナ）での入力が必須である')
  end

  it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
    @user.last_name_kana = FactoryBot.build(:user, last_name_kana: 'あいうえお')
    @user.valid?
    expect(@user.errors[:last_name_kana]).to include('全角（カタカナ）での入力が必須である')
  end
end
