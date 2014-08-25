require "active_record/base"

module DocumentNumber
  class Numerator
    # Gets next number for document
    def self.next_number(document, options)
      DocumentNumber.transaction(:requires_new => true) do
        if ActiveRecord::VERSION::MAJOR < 4
          document_number = DocumentNumber.lock(true).find_or_initialize_by_document(document)
        else
          document_number = DocumentNumber.lock(true).find_or_initialize_by(:document => document)
        end

        number = document_number.number == 1 ? options[:start] : document_number.number

        document_number.number = number + 1
        document_number.save!

        number
      end
    end
  end
end
