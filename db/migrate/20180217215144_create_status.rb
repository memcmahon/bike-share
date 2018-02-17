class CreateStatus < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.integer :bikes_available
      t.integer :docks_available
      t.datetime :time
      t.references :station, foreign_key: true
    end
  end
end
