module Iyzipay
  module Model
    module V2
      class Subscription < IyzipayResource
        def activate(request = {}, options)
          pki_string = to_pki_string_activate(request)
          HttpClient.post("#{options.base_url}/v2/subscription/subscriptions/#{request[:subscriptionReferenceCode]}/activate",
                          get_http_header(pki_string, options), request.to_json)
        end

        def retry(request = {}, options)
          pki_string = to_pki_string_retry(request)
          HttpClient.post("#{options.base_url}/v2/subscription/subscriptions//operation/retry",
                          get_http_header(pki_string, options), request.to_json)
        end
        def upgrade(request = {}, options)
          pki_string = to_pki_string_upgrade(request)
          HttpClient.post("#{options.base_url}/v2/subscription/subscriptions/#{request[:subscriptionReferenceCode]}/upgrade",
                          get_http_header(pki_string, options), request.to_json)
        end

        def cancel(request = {}, options)
          pki_string = to_pki_string_cancel(request)
          HttpClient.post("#{options.base_url}/v2/subscription/subscriptions/#{request[:subscriptionReferenceCode]}/cancel",
                          get_http_header(pki_string, options), request.to_json)
        end

        def details(request = {}, options)
          pki_string = to_pki_string_details(request)
          HttpClient.post("#{options.base_url}/v2/subscription/subscriptions/#{request[:subscriptionReferenceCode]}",
                          get_http_header(pki_string, options), request.to_json)
        end

        def search(request = {}, options)
          pki_string = to_pki_string_details(request)
          HttpClient.post("#{options.base_url}/v2/subscription/subscriptions/",
                          get_http_header(pki_string, options), request.to_json)
        end

        def to_pki_string_activate(request)
          PkiBuilder.new.append_super(super).
              append(:subscriptionReferenceCode, request[:subscriptionReferenceCode]).
              get_request_string
        end

        def to_pki_string_retry(request)
          PkiBuilder.new.append_super(super).
              append(:referenceCode, request[:referenceCode]).
              get_request_string
        end

        def to_pki_string_upgrade(request)
          PkiBuilder.new.append_super(super).
              append(:subscriptionReferenceCode, request[:subscriptionReferenceCode]).
              append(:newPricingPlanReferenceCode, request[:newPricingPlanReferenceCode]).
              append(:upgradePeriod, request[:upgradePeriod]).
              append(:useTrial, request[:useTrial]).
              append(:resetRecurrenceCount, request[:resetRecurrenceCount]).
              get_request_string
        end

        def to_pki_string_cancel(request)
          PkiBuilder.new.append_super(super).
              append(:locale, request[:locale]).
              append(:conversationId, request[:conversationId]).
              append(:subscriptionReferenceCode, request[:subscriptionReferenceCode]).
              get_request_string
        end

        def to_pki_string_details(request)
          PkiBuilder.new.append_super(super).
              append(:subscriptionReferenceCode, request[:subscriptionReferenceCode]).
              get_request_string
        end

        def to_pki_string_search(request)
          PkiBuilder.new.append_super(super).
              append(:subscriptionReferenceCode, request[:subscriptionReferenceCode]).
              append(:parentReferenceCode, request[:parentReferenceCode]).
              append(:customerReferenceCode, request[:customerReferenceCode]).
              append(:pricingPlanReferenceCode, request[:pricingPlanReferenceCode]).
              append(:subscriptionStatus, request[:subscriptionStatus]).
              append(:startDate, request[:startDate]).
              append(:endDate, request[:endDate]).
              append(:page, request[:page]).
              append(:Count, request[:Count]).
              get_request_string
        end
      end
    end
  end
end
