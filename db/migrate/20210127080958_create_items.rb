class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,             null: false
      t.text :explanation,                null: false
      t.integer :category_id,             null: false
      t.integer :state_id,                null: false
      t.integer :burden_id,               null: false
      t.integer :area_id,                 null: false
      t.integer :number_of_time_id,       null: false
      t.integer :price,                   null: false
      t.references :user,                 foreign_key: true
    end
  end
end


