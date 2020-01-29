# frozen_string_literal: true

module Iyzipay
  module Model
    module V2
      class Product < IyzipayResourceV2
        @resource = '/v2/subscription/products'

        def list(options)
          header = get_http_header(options, @resource)
          HttpClient.get(base_url(options), header)
        end

        def create(request, options)
          data = request.to_json
          header = get_http_header(options, @resource, data)
          HttpClient.post(base_url(options), header, data)
        end

        def update(request, options)
          data = request.to_json
          url = "#{base_url(options)}/#{request[:productReferenceCode]}"
          header = get_http_header(options, url, data)
          HttpClient.put(url, header, data)
        end

        private

        def base_url(options)
          "#{options.base_url}#{@resource}"
        end
      end
    end
  end
end
