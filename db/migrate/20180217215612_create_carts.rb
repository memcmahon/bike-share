class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.references :accessory, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
