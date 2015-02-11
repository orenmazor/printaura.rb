require "printaura/api"

module Printaura
  class Product
    def self.all
      # do i care?
      Api.viewproducts.each do |prod|
        puts prod
      end
    end

    def initialize(brand, colors, image_id, price, app_ids, title, product_id, sku, shopify)
      # lol :(
      args = {brand_id: brand, colors: Base64.encode64(colors.to_json), front_print: image_id, title: title, description: "", product_price: price, apps: Base64.encode64(app_ids.to_json), product_id: product_id, sku: sku, storeimages: Base64.encode64({"0"=>{"image_id"=> image_id, "default"=>"1"}}.to_json)}
      if shopify
        args = args.merge(shopify)
      end
      Api.addproduct(args)
    end
  end
end
