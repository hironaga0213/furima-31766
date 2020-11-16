class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code
      t.integer     :prefecture_id,    foreign_key: true
      t.string      :municipality
      t.string      :house_number
      t.string      :building
      t.integer     :phone_number
      t.references  :purchase,         foreign_key: true
      t.timestamps
    end
  end
end
