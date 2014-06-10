class CreateDocumentNumbers < ActiveRecord::Migration
  def change
    create_table :document_numbers do |t|
      t.string   :document
      t.integer  :number, :null => false, :default => 1
      t.datetime :created_at
    end
    add_index :document_numbers, :document
  end
end
