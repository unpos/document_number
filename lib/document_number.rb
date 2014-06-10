require "document_number/document_number"
require "document_number/has_document_number"
require "document_number/numerator"

# ActiveRecord::Base.send :include, DocumentNumber

ActiveSupport.on_load(:active_record) do
  include DocumentNumber::Model
end
