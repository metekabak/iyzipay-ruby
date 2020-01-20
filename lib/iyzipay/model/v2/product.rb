module Iyzipay
  module Model
    module V2
      class Product < IyzipayResource
        def create(request = {}, options)
          pki_string = to_pki_string_create(request)
          HttpClient.post("#{options.base_url}/v2/subscription/products/",
                          get_http_header(pki_string, options), request.to_json)
        end

        def update(request = {}, options)
          pki_string = to_pki_string_update(request)
          HttpClient.put("#{options.base_url}/v2/subscription/products/#{request[:productReferenceCode]}",
                         get_http_header(pki_string, options), request.to_json)
        end

        def to_pki_string_create(request)
          unless request.nil?
            PkiBuilder.new.
                append(:locale, request[:locale]).
                append(:conversationId, request[:conversationId]).
                append(:name, request[:name]).
                append(:description, request[:description]).
                get_request_string
          end
        end
        def to_pki_string_update(request)
          unless request.nil?
            PkiBuilder.new.
                append(:locale, request[:locale]).
                append(:conversationId, request[:conversationId]).
                append(:productReferenceCode, request[:productReferenceCode]).
                append(:name, request[:name]).
                append(:description, request[:description]).
                get_request_string
          end
        end
      end
    end
  end
end
