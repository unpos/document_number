module DocumentNumber
  module Model

    def self.included(base)
      base.send :extend, ClassMethods
      attr_accessor :with_number
    end

    module ClassMethods
      # Declare this in your model to automatic document number assignment
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
      #
      # Use params `with_number` to create an object with predefined number
      def has_document_number(options = {})
        options.reverse_merge! :column => :number, :start => 1

        class_attribute :document_number_options
        self.document_number_options = options.dup

        method_name = "auto_increment_#{options[:column]}"

        before_validation method_name
        after_initialize method_name, :if => Proc.new { with_number == true }

        define_method method_name do
          return if send(options[:column]).present?
          number = Numerator.next_number(self.class.to_s.underscore, options)
          prefix = options[:prefix].present? ? options[:prefix] : ::DocumentNumber.configuration.prefix
          write_attribute options[:column], "#{prefix}#{number}"
        end
      end

      # Use this with your model to obtain an array of numbers
      #
      # Usage:
      # numbers = Invoice.get_numbers(100)
      def get_numbers(quantity)
        Array.new(Integer(quantity)) do
          "#{document_number_options[:prefix]}#{Numerator.next_number(to_s.underscore, document_number_options)}"
        end
      rescue
        []
      end
    end
  end
end
