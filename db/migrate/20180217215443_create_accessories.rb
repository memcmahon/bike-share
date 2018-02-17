class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.integer :price
      t.string :name
      t.text :description
      t.integer :status
    end
  end
end
