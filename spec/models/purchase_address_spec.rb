require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do
    context '購入がうまくいくとき' do
      it "token, postal_code、prefectures_id, municipality, house_number, building, phone_numberが存在すれば登録できる" do
        expect(@purchase_address).to be_valid
      end

      it "buildingが空でも登録できる" do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "tokenが空だと登録できない" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空だと登録できない" do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeに-がないと登録できない" do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが選択されていないと登録できない" do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture Select")
      end

      it "prefecture_idが空だと登録できない" do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture Select")
      end

      it "municipalityが空だと登録できない" do
        @purchase_address.municipality = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it "house_numberが空だと登録できない" do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it "phone_numberが空だと登録できない" do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberに-が入っていると登録できない" do
        @purchase_address.phone_number = "050-111-111"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end

      it "phone_numberが12桁以上だと登録できない" do
        @purchase_address.phone_number = "123456789101"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number 11 or less")
      end
    end
  end
end
