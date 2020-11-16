class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_time

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :title
    validates :introduction
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_time_id
    end    
    validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,5}/, message: 'Half-width number' }, :numericality => { :greater_than_or_equal_to => 300, :less_than => 10000000, message: 'Out of setting range' }
  end

end
