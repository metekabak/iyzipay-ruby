module Iyzipay
  module Model
    module V2
      class Subscription < IyzipayResourceV2
        RESOURCE = '/v2/subscription/subscriptions'
        def activate(request, options)
          path = path_for_action(request[:subscriptionReferenceCode], 'action')
          data = request.to_json
          header = get_http_header(options, path, data)
          HttpClient.post_even_on_error(base_url(options, path), header, data)
        end

        def retry(request, options)
          path = path_for_action('/operation/retry')
          data = request.to_json
          header = get_http_header(options, path,  data)
          HttpClient.post_even_on_error(base_url(options, path), header, data)
        end

        def upgrade(request, options)
          path = path_for_action(request[:subscriptionReferenceCode], 'upgrade')
          data = request.to_json
          header = get_http_header(options, path, data)
          HttpClient.post_even_on_error(base_url(options, path), header, data)
        end

        def cancel(request, options)
          path = path_for_action(request[:subscriptionReferenceCode], 'cancel')
          data = request.to_json
          header = get_http_header(options, path, data)
          HttpClient.post_even_on_error(base_url(options, path), header, data)
        end

        def details(request, options)
          path = path_for_action(request[:subscriptionReferenceCode])
          data = request.to_json
          header = get_http_header(options, path, data)
          HttpClient.post_even_on_error(base_url(options, path), header, data)
        end

        def search(request, options)
          data = request.to_json
          header = get_http_header(options, RESOURCE, data)
          HttpClient.get_even_on_error(base_url(options, RESOURCE), header, data)
        end

        private

        def base_url(options, path = nil)
          "#{options.base_url}#{path}"
        end

        def path_for_action(*args)
          "#{RESOURCE}#{'/' + args.join('/')}"
        end
      end
    end
  end
end
