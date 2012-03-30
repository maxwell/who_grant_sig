module WhoGrantSig
 class Validator
    attr_accessor :from_header, :signature_header, :time_header

    def initialize(from_header, signature_header, time_header)
      self.from_header = from_header
      self.signature_header = signature_header
      self.time_header = time_header
      @from = Webfinger.new(from).fetch
    end

    def valid?  
      signature_is_valid? && grant_is_still_valid?
    end

    private 
    def reconstructed_grant
      [from_header, time.to_s].join(',')
    end

    def signature_is_valid?
      public_key.verify(OpenSSL::Digest::SHA256.new, signature, reconstructed_grant)
    end

    def grant_is_still_valid?
      time < Time.now +  5.mintues
    end


    #private
    def signature
      signature_header.strip!
    end

    def from
      from_header.strip!
    end


    def time
      Time.parse(time_header)
    end

    def public_key 
      @from.public_key
    end
  end
end