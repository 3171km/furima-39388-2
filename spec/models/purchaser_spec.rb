require 'rails_helper'

RSpec.describe Purchaser, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchaser = FactoryBot.build(:purchaser, user_id: @user.id, item_id: @item.id)
      sleep 1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchaser).to be_valid
      end

      it 'address2は空でも購入できること' do
        @purchaser.address2 = ''
        expect(@purchaser).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと購入できないこと' do
        @purchaser.zip_code = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Zip code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列の正しい形式でないと購入できないこと' do
        @purchaser.zip_code = '1234567'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Zip code は無効です。 ハイフン(-)を含めて入力してください。")
      end
      it 'regionを選択していないと購入できないこと' do
        @purchaser.region_id = nil
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @purchaser.city = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空だと購入できないこと' do
        @purchaser.address1 = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Address1 can't be blank")
      end
      it '電話番号が空では購入できないこと' do
        @purchaser.telephone = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号は、10桁未満であると購入できないこと' do
        @purchaser.telephone = '12345'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Telephone は無効です。数字のみ入力してください")
      end
      it '電話番号は、11桁以上であると購入できないこと' do
        @purchaser.telephone = '0234512345123'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Telephone は無効です。数字のみ入力してください")
      end
      it '電話番号は半角数値以外購入できないこと' do
        @purchaser.telephone = '020-4512-3451'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Telephone は無効です。数字のみ入力してください")
      end
      it 'userが紐づいていなければ購入できない' do
        @purchaser.user_id = nil
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できない' do
        @purchaser.item_id = nil
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Item can't be blank")
      end
      it 'トークンが空では購入できないこと' do
        @purchaser.token = nil
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Token can't be blank")
    end
    end
    end