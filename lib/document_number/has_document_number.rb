module DocumentNumber
  module Model

    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      # Declare this in your model to automatically document number assignment
      #
      # Usage:
      # class Invoice < ActiveRecord::Base
      #   has_document_number
      # end
      #
      # Options:
      # :column        the column name to update. Default value is `:number`.
      # :prefix        the prefix for number.
      # :start         the start value for number
      def has_document_number(options = {})
        options.reverse_merge! column: :number, prefix: '', start: 0

        method_name = "auto_increment_#{options[:column]}"

        before_create method_name

        define_method method_name do
          return if send(options[:column]).present?
          number = Numerator.next_number(self, options)
          write_attribute options[:column], "#{options[:prefix]}#{number}"
        end
      end
    end
  end
end
