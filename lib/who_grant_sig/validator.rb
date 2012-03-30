module WhoGrantSig
 class Validator
    attr_accessor :from_header, :signature_header, :time_header

    def initialize(from_header,  time_header, signature_header)
      self.from_header = from_header
      self.time_header = time_header
      self.signature_header = signature_header
      @from = find_author(from_header)
    end

    def verified?  
      signature_is_valid? && grant_is_still_valid?
    end

    private 
    def reconstructed_grant
      puts from
      puts time
      [from, time].join(',')
    end

    def signature_is_valid?
      public_key.verify(OpenSSL::Digest::SHA256.new, signature, reconstructed_grant)
    end

    def grant_is_still_valid?
      time < Time.now +  TIME_THRESHOLD
    end


    #private
    def signature
      signature_header.strip
    end

    def from
      from_header.strip
    end


    def time
      Time.at(time_header.to_i)
    end

    def find_author(from)
      Webfinger.new(from).fetch
    end

    def public_key 
      @from.public_key
    end
  end
end