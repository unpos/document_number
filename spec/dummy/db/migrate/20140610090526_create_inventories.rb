class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :number

      t.timestamps
    end
  end
end
