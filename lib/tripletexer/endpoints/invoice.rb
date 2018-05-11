# frozen_string_literal: true

module Tripletexer::Endpoints
  class Invoice < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/invoice/search
    def search(date_from, date_to, params = {})
      final_params = params.merge(
        'invoiceDateFrom' => ::Tripletexer::FormatHelpers.format_date(date_from),
        'invoiceDateTo' => ::Tripletexer::FormatHelpers.format_date(date_to)
      )
      find_entities('/v2/invoice', final_params)
    end

    # https://tripletex.no/v2-docs/#!/invoice/post
    def create(body)
      create_entity('/v2/invoice', body)
    end

    def create_without_notification(body)
      create_entity('/v2/invoice?sendToCustomer=false', body)
    end

    # https://tripletex.no/v2-docs/#!/invoice/get
    def find(id, params = {})
      find_entity("/v2/invoice/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/invoice/downloadPdf
    def download_pdf(id)
      api_client.get("/v2/invoice/#{id}/pdf")
    end

    # https://tripletex.no/v2-docs/#!/invoice/payment
    def update_with_payment(id, payment_date, payment_type_id, paid_amount)
      final_params = {
        'paymentDate' => payment_date,
        'paymentTypeId' => payment_type_id,
        'paidAmount' => paid_amount
      }
      api_client.put("/v2/invoice/#{id}/:payment?paymentDate=#{payment_date}&paymentTypeId=#{payment_type_id}&paidAmount=#{paid_amount}")
    end

    def send_notification(id, send_type = 'EMAIL')
      api_client.put("/v2/invoice/#{id}/:send?sendType=#{send_type}")
    end

    def payment_type
      Tripletexer::Endpoints::Invoice::PaymentType.new(api_client)
    end
  end
end
