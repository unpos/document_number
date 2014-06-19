require 'singleton'

module DocumentNumber
  class Configuration
    include Singleton
    attr_accessor :prefix

    def initialize
      @prefix = ''
    end
  end
end
