module Iyzipay
  module Model
    module V2
      class CheckoutFormInitialize < IyzipayResource
        def create(request = {}, options)
          pki_string = to_pki_string(request)
          HttpClient.post("#{options.base_url}/v2/subscription/checkoutform/initialize",
                          get_http_header(pki_string, options), request.to_json)
        end

        def to_pki_string(request)
          PkiBuilder.new.append_super(super).
              append_price(:locale, request[:locale]).
              append_price(:conversationId, request[:conversationId]).
              append(:callbackUrl, request[:callbackUrl]).
              append(:pricingPlanReferenceCode, request[:pricingPlanReferenceCode]).
              append(:subscriptionInitialStatus, request[:subscriptionInitialStatus]).
              append(:name, request[:name]).
              append(:surname, request[:surname]).
              append(:email, request[:email]).
              append(:gsmNumber, request[:gsmNumber]).
              append(:identityNumber, request[:identityNumber]).
              append(:shippingAddress, Address.to_pki_string(request[:shippingAddress])).
              append(:billingAddress, Address.to_pki_string(request[:billingAddress])).
              get_request_string
        end
      end
    end
  end
end