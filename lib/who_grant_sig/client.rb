module WhoGrantSig
  class Client

    def get(requestor, url)
      conn = Faraday.new do |builder|
        builder.use Faraday::Request::UrlEncoded  # convert request params as "www-form-urlencoded"
        builder.use Faraday::Response::Logger     # log the request to STDOUT
        builder.use Faraday::Adapter::NetHttp     # make http requests with Net::HTTP

        builder.use Faraday::Request::WhoGrantSig, requestor
      end

      conn.get(url)
    end
  end
end