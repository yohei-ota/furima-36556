require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品出品できるとき" do
      it "全ての項目が存在すれば商品を出品できる" do
        expect(@item).to be_valid
      end
      it "priceが¥300以上なら出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "priceが¥9999999以下なら出品できる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end


    context "商品出品できないとき" do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameがからだと出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "textが空だと出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "categoryが空だと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を正しく入力してください")
      end
      it "categoryのidが1(---)だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を正しく入力してください")
      end
      it "statusが空だと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status を正しく入力してください")
      end
      it "statusのidが1(---)だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status を正しく入力してください")
      end
      it "costが空だと出品できない" do
        @item.cost_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost を正しく入力してください")
      end
      it "costのidが1(---)だと出品できない" do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost を正しく入力してください")
      end
      it "areaが空だと出品できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area を正しく入力してください")
      end
      it "areaのidが1(---)だと出品できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area を正しく入力してください")
      end
      it "dayが空だと出品できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day を正しく入力してください")
      end
      it "dayのidが1(---)だと出品できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day を正しく入力してください")
      end
      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥300未満だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが¥9999999以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが整数以外だと出品できない" do
        @item.price = 300.00
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it "priceが全角数字だと出品できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英数字混合だと出品できない" do
        @item.price = "123abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英字だと出品できない" do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "紐づくuserが存在しないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
