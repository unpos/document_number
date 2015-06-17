class SupplierComplaints < ActiveRecord::Migration
  def change
    create_table :supplier_complaints do |t|
      t.string :number
      t.string :text

      t.timestamps
    end
  end
end
