class SupplierComplaint < ActiveRecord::Base
  has_document_number start: 500

  validates :text, presence: true
  validates :number, presence: true
end
