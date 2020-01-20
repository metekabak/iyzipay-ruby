module Iyzipay
  module Model
    module V2
      class PaymentCard
        def self.to_pki_string(request)
          unless request.nil?
            PkiBuilder.new.
                append(:cardHolderName, request[:cardHolderName]).
                append(:cardNumber, request[:cardNumber]).
                append(:expireYear, request[:expireYear]).
                append(:expireMonth, request[:expireMonth]).
                append(:cvc, request[:cvc]).
                append(:registerConsumerCard, request[:registerConsumerCard]).
                append(:ucsToken, request[:ucsToken]).
                append(:cardToken, request[:cardToken]).
                append(:consumerToken, request[:consumerToken]).
                get_request_string
          end
        end
      end
    end
  end
end

