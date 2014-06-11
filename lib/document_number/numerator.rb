require "active_record/base"

module DocumentNumber
  class Numerator
    def self.next_number(object, options)
      DocumentNumber.transaction do
        document_number = DocumentNumber.lock(true).find_or_initialize_by(document: object.class.to_s.underscore)

        number = options[:start] if document_number.number == 1

        document_number.number += 1
        document_number.save!

        number
      end
    end
  end
end
