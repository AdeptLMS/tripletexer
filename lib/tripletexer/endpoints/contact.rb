# frozen_string_literal: true

module Tripletexer::Endpoints
  class Contact < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/contact/search
    def search(params = {})
      find_entities('/v2/contact', params)
    end

    # https://tripletex.no/v2-docs/#!/contact/post
    def create(body)
      create_entity('/v2/contact', body)
    end

    # https://tripletex.no/v2-docs/#!/contact/get
    def find(id, params = {})
      find_entity("/v2/contact/#{id}", params)
    end

  end
end
