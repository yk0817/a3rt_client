require "faraday"
require "json"

module A3rt
  class Client
    DOMAIN = "https://api.a3rt.recruit-tech.co.jp"
    
    class << self
      def talk_api(apikey: , query: , callback: nil)
        params = make_params(apikey: apikey, query: query, callback: callback)
        http_request("/talk/v1/smalltalk", :post, params)
      end

      def text_suggest(apikey: , previous_description:, callback: nil, style: nil, separation: nil)
        params = make_params(apikey: apikey, previous_description: previous_description, callback: callback, style: style, separation: separation)
        http_request("/text_suggest/v2/predict", :get, params)
      end

      private

        def make_params(**params)
          params.reject{|k, v| v.nil? }
        end

        def http_request(path, method, params = {})
          res = Faraday.post(DOMAIN + path, params) if method == :post
          res = Faraday.get(DOMAIN + path, params) if method == :get
          JSON.parse(res.body)
        end
    end
  end
end