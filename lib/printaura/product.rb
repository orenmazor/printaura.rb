require "printaura/api"

module Printaura
  class Product
    def self.all
      api.get(method: "viewproducts")
    end
  end
end
