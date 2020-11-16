class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :token, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :house_number
    validates :phone_number, numericality: {with: /[0-9]{,11}/, message: "Input only number"}
  end

  def save
    Address.create(postal_code: postal_code, municipality: municipality, house_number: house_number, phone_number: phone_number)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end