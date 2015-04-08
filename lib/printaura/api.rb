require 'rest-client'

module Printaura
  class Api
    def self.method_missing(m, *args, &block)
      #we only really care about the array options
      options = args.last || {}

      postparams= {key: Printaura::Config.API_KEY, hash: Printaura::Config.API_HASH, method: m}.update(options)
      puts postparams

      result = JSON.parse(RestClient.post("http://www.api.printaura.com/api.php", postparams))

      raise result["message"] unless result["status"]

      return result
    end
  end
end
