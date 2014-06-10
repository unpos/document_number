require "active_record/base"

module DocumentNumber
  class Numerator
    def self.next_number(object, options)
      DocumentNumber.transaction do
        document_number = DocumentNumber.lock(true).find_or_initialize_by(document: object.class.to_s.underscore)

        document_number.number = options[:start] if document_number.number == 0
        document_number.number += 1
        document_number.save!

        document_number.number
      end
    end
  end
end
