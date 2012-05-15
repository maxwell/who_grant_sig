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
      @user = user
    end
    
    

    def call(env)
      sig = WhoGrantSig::Header.new(@user)
      env[:request_headers].merge!(sig.grant)
      puts env.inspect
      @app.call env
    end
  end
end