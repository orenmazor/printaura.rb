require "printaura/api"

module Printaura
  class Product
    def self.all
      # do i care?
      api.viewproducts.each do |prod|
        puts prod
      end
    end

    def initialize(brand, colors, tags, image_path)
      image_id = api.uploadimage(image_path)
      api.addproduct(args)
    end
  end
end
