class AddAvatarColumnsToAccessories < ActiveRecord::Migration[5.1]
  def up
    add_attachment :accessories, :avatar
  end

  def down
    remove_attachment :accessories, :avatar
  end
end
