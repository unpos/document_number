require "document_number/configuration"
require "document_number/has_document_number"
require "document_number/numerator"
require "document_number/document_number"

module DocumentNumber
  # Default prefix for number
  def self.prefix=(value)
    ::DocumentNumber.configuration.prefix = value
  end

  private

  def self.configuration
    @@configuration ||= ::DocumentNumber::Configuration.instance
  end

  def self.configure
    yield configuration
  end
end

ActiveSupport.on_load(:active_record) do
  include ::DocumentNumber::Model
end
