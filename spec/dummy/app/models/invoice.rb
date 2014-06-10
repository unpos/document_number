class Invoice < ActiveRecord::Base
  has_document_number prefix: 'invoice/'
end
