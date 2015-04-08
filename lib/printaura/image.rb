require "printaura/api"

module Printaura
  class Image
    attr_accessor :image_id

    def initialize(filename)
      if filename.is_a?(String)
        filename = File.new(filename)
      end

      result = Api.uploadimage({file: filename})
      @image_id = result["results"]["image_id"]
    end
  end
end
