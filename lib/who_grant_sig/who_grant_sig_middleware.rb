require 'faraday'

module Faraday
  class Request::WhoGrantSig < Faraday::Middleware
    begin
      require 'who_grant_sig'

    rescue LoadError, NameError => e
      self.load_error = e
    end
    
    def initialize(app, user)
      @app = app
      @user = args.shift
    end
    
    

    def call(env)
      params = env[:url].query_values || {}
      sig = WhoGrantSig::Header.new(@user)
      env[:request_headers].merge!(sig.grant)
      @app.call env
    end
  end
end