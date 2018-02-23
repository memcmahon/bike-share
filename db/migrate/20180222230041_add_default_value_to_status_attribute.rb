class AddDefaultValueToStatusAttribute < ActiveRecord::Migration[5.1]
  def change
    change_column :accessories, :status, :integer, default: 0
  end
end
