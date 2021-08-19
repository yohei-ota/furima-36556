require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上で英数字混合なら登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "first_nameに漢字かひらがなかカタカナが存在すれば登録できる" do
        @user.first_name = "やまだ"
        expect(@user).to be_valid
      end
      it "last_nameに漢字かひらがなかカタカナが存在すれば登録できる" do
        @user.last_name = "りくたろう"
        expect(@user).to be_valid
      end
      it "first_name_kanaがカタカナであれば登録できる" do
        @user.first_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "last_name_kanaがカタカナであれば登録できる" do
        @user.last_name_kana = "リクタロウ"
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていなければ登録できない" do
        @user.email = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = "456def"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "重複したemailが存在すれば登録できない" do
        @user.save
        another = FactoryBot.build(:user)
        another.email = @user.email
        another.valid?
        expect(another.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英数字で入力してください")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英数字で入力してください")
      end
      it "passwordが全角だと登録できない" do
        @user.password = "１２３ａｂｃ"
        @user.password_confirmation = "１２３ａｂｃ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英数字で入力してください")
      end
      it "first_nameに漢字かひらがなかカタカナが存在しないと登録できない" do
        @user.first_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には漢字・ひらがな・カタカナを入力してください")
      end
      it "last_nameに漢字かひらがなかカタカナが存在しないと登録できない" do
        @user.last_name = "rikutarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には漢字・ひらがな・カタカナを入力してください")
      end
      it "first_name_kanaがカタカナ以外だと登録できない" do
        @user.first_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana にはカタカナを入力してください")
      end
      it "last_name_kanaがカタカナ以外だと登録できない" do
        @user.last_name_kana = "陸太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana にはカタカナを入力してください")
      end
    end
  end
end
