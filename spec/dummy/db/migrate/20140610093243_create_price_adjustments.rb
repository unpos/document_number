class CreatePriceAdjustments < ActiveRecord::Migration
  def change
    create_table :price_adjustments do |t|
      t.string :document_number

      t.timestamps
    end
  end
end
