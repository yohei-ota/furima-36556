require 'rails_helper'

RSpec.describe BoughtLogBoughtUser, type: :model do
  before do
    item = FactoryBot.create(:item)
    sleep 0.1
    @log = FactoryBot.build(:bought_log_bought_user, item_id: item.id, user_id: item.user.id)
  end

  describe "商品購入機能" do
    context "商品購入できるとき" do
      it "全ての項目が存在すれば商品を出購入できる" do
        expect(@log).to be_valid
      end
      it "buidingが空でも商品を出購入できる" do
        @log.building = ''
        expect(@log).to be_valid
      end
    end

    context "商品購入できないとき" do
      it "postal_codeが空だと購入できない" do
        @log.postal_code = ""
        @log.valid?
        expect(@log.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフン(-)が含まれてないと購入できない" do
        @log.postal_code = "1234567"
        @log.valid?
        expect(@log.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeが6桁以下だと購入できない" do
        @log.postal_code = "123-456"
        @log.valid?
        expect(@log.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeが8桁以上だと購入できない" do
        @log.postal_code = "1234-5678"
        @log.valid?
        expect(@log.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "areaが空だと購入できない" do
        @log.area_id = ""
        @log.valid?
        expect(@log.errors.full_messages).to include("Area を正しく入力してください")
      end
      it "areのidが1だと購入できない" do
        @log.area_id = 1
        @log.valid?
        expect(@log.errors.full_messages).to include("Area を正しく入力してください")
      end
      it "munucipalitiesが空だと購入できない" do
        @log.munucipalities = ""
        @log.valid?
        expect(@log.errors.full_messages).to include("Munucipalities can't be blank")
      end
      it "addressが空だと購入できない" do
        @log.address = ""
        @log.valid?
        expect(@log.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと購入できない" do
        @log.phone_number = ""
        @log.valid?
        expect(@log.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが全角だと購入できない" do
        @log.phone_number = "０９０１２３４５６７８"
        @log.valid?
        expect(@log.errors.full_messages).to include("Phone number を正しく入力してください")
      end
      it "phone_numberに数字以外(ハイフンなど)が入ると購入できない" do
        @log.phone_number = "090-1234-5678"
        @log.valid?
        expect(@log.errors.full_messages).to include("Phone number を正しく入力してください")
      end
      it "phone_numberが9桁以下だと購入できない" do
        @log.phone_number = "090123456"
        @log.valid?
        expect(@log.errors.full_messages).to include("Phone number を正しく入力してください")
      end
      it "phone_numberが12桁以上だと購入できない" do
        @log.phone_number = "090123456789"
        @log.valid?
        expect(@log.errors.full_messages).to include("Phone number を正しく入力してください")
      end
      it "tokenが空だと購入できない" do
        @log.token = ""
        @log.valid?
        expect(@log.errors.full_messages).to include("Token can't be blank")
      end
      it "紐づくitem_idが存在しないと購入できない" do
        @log.item_id = nil
        @log.valid?
        expect(@log.errors.full_messages).to include("Item can't be blank")
      end
      it "紐づくuser_idが存在しないと購入できない" do
        @log.user_id = nil
        @log.valid?
        expect(@log.errors.full_messages).to include("User can't be blank")
      end
    end



  end
end
