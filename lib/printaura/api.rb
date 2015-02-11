require 'httparty'

module Printaura
  class Api
    def self.method_missing(m, *args, &block)
      #we only really care about the array options
      options = args.last || {}

      postparams= options.update({key: Printaura::Config.API_KEY, hash: Printaura::Config.API_HASH, method: m}).map {|k,v| "#{k}=#{v}"}.join("&")

      puts postparams
      result = JSON.parse(HTTParty.post("http://www.api.printaura.com/api.php", body: postparams))
      raise result["message"] unless result["status"]

      return result
    end
  end
end
