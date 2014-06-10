class PriceAdjustment < ActiveRecord::Base
  has_document_number start: 500, column: 'document_number'
end
