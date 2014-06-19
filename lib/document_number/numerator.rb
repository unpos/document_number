require "active_record/base"

module DocumentNumber
  class Numerator
    def self.next_number(object, options)
      DocumentNumber.transaction do
        if ::Rails.version < "4.0"
          # Rails 3 support
          document_number = DocumentNumber.lock(true).find_or_initialize_by_document(object.class.to_s.underscore)
        else
          document_number = DocumentNumber.lock(true).find_or_initialize_by(:document => object.class.to_s.underscore)
        end

        number = document_number.number == 1 ? options[:start] : document_number.number

        document_number.number = number + 1
        document_number.save!

        number
      end
    end
  end
end
