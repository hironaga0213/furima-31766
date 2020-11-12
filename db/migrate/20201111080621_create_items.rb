class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :title
      t.text        :introduction
      t.integer     :category_id,      foreign_key: true
      t.integer     :status_id,        foreign_key: true
      t.integer     :delivery_fee_id,  foreign_key: true
      t.integer     :prefecture_id,   foreign_key: true
      t.integer     :delivery_time_id, foreign_key: true
      t.integer     :price
      t.references  :user,             foreign_key: true
      t.timestamps
    end
  end
end
