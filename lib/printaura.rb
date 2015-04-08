require "printaura/version"
require "printaura/product"
require "printaura/image"

module Printaura
  class Config
    def self.API_KEY
      @API_KEY
    end

    def self.API_HASH
      @API_HASH
    end

    def self.API_KEY=(key)
      @API_KEY=key
    end

    def self.API_HASH=(hash)
      @API_HASH=hash
    end
  end
end
