require 'httparty'

module Printaura
  class Api
    def self.method_missing(m, *args, &block)
      body = {key: Printaura::Config.API_KEY, hash: Printaura::Config.API_HASH, method: m}.map {|k,v| "#{k}=#{v}"}.join("&")
      result = JSON.parse(HTTParty.post("http://www.api.printaura.com/api.php", {body: body}).to_s)
      raise result["message"] unless result["status"]

      return result
    end
  end
end
