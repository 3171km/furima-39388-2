require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context '新規登録できる場合' do
        it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end
      context '新規登録できない場合' do
        it "nicknameが空では登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
      end
        it "passwordが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
      end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
        it '英字のみのパスワードでは登録できない' do
        @user.password = 'hoge'
        @user.password_confirmation = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include ('Password は半角英数字混合で入力してください')
      end
        it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include ('Password は半角英数字混合で入力してください')
      end
        it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｈｙ'
        @user.password_confirmation = 'ｈｙ'
        @user.valid?
        expect(@user.errors.full_messages).to include ('Password は半角英数字混合で入力してください')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '姓（全角）が空だと登録できない' do
        @user.sur_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sur name が無効です")
      end
      it '名（全角）が空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name が無効です")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.sur_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sur name が無効です')
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.name = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name が無効です')
      end
      it '姓（カナ）が空だと登録できない' do
        @user.sur_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Sur name katakana が無効です')
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.sur_name_katakana = 'yマダ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sur name katakana が無効です')
      end
        it '名（カナ）が空だと登録できない' do
        @user.name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name katakana が無効です")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.name_katakana = 'rクタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name katakana が無効です')
      end
      it '生年月日が空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
