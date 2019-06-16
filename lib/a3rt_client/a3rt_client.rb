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

      def text_suggest(apikey: , previous_description: , callback: nil, style: nil, separation: nil)
        params = make_params(apikey: apikey, previous_description: previous_description, callback: callback, style: style, separation: separation)
        http_request("/text_suggest/v2/predict", :get, params)
      end

      def text_summarization(apikey: , sentences: , linenumber: nil, separation: nil)
        params = make_params(apikey: apikey, sentences: sentences, linenumber: linenumber, separation: separation)
        http_request("/text_summarization/v1", :post, params)
      end

      def image_search(apikey: , query: )
        params = make_params(apikey: apikey, query: query)
        http_request("/image_search/v1/search_by_text", :get, params)
      end

      def proofreading(apikey: , sentence: , callback: nil, sensitivity: nil)
        params = make_params(apikey: apikey, sentence: sentence, callback: callback, sensitivity: sensitivity)
        http_request("/proofreading/v2/typo", :get, params)
      end

      def sql_suggest(apikey: , model_id: , text: )
        params = make_params(apikey: apikey, model_id: model_id, text: text)
        http_request("/sql_suggest/v1/predict", :get, params)
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
# A3rt::Client.text_summarization(apiKey: "DZZyDsXDVyWJFnOYphtldzuX6tz0u2ln", sentences: "こんにちわ。こんにちわ。")
# A3rt::Client.image_search(apikey: "DZZ9TIu4JvnB87Pv2LHvW6Z3n3KAP9gR", query: "動物")