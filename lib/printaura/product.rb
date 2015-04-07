require "printaura/api"

module Printaura
  class Product
    attr_accessor :shopify_product_id
    attr_accessor :printaura_product_id

    def self.all
      # do i care?
      Api.viewproducts.each do |prod|
        puts prod
      end
    end

    def initialize(brand, colors, image_id, mock_image_id, price, app_ids, title, product_id, sku, shopify)
      # lol :(
      store_images = {"0" => {"image_id" => image_id, "default" => "0"}, "1" => {"image_id" => mock_image_id, "default"=>"1"}}
      args = {brand_id: brand, colors: Base64.encode64(colors.to_json), front_print: image_id, front_mockup: mock_image_id, title: title, description: "", product_price: price, apps: Base64.encode64(app_ids.to_json), product_id: product_id, sku: sku, storeimages: Base64.encode64(store_images.to_json)}
      if shopify
        args = args.merge(shopify)
      end
      @shopify_product_id = Api.addproduct(args)["results"]["shopify_id"]
      @printaura_product_id = Api.addproduct(args)["results"]["product_id"]
    end
  end
end
