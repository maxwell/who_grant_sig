
module WhoGrantSig
  class Header
    attr_accessor :signer, :email_identifier

    def initialize(signer)
      self.signer = signer
      self.email_identifier = self.signer.email_identifier
    end


    def grant
      {
        FROM_HEADER => email_identifier,
        TIME_HEADER => valid_until,
        SIGNATURE_HEADER => signature
      }
    end

    def valid_until
      @time ||= (Time.now + TIME_THRESHOLD).to_i.to_s
    end

    def id_string
      [email_identifier, valid_until].join(',')
    end

    #where should I base64?
    def signature
      Base64.encode64(encryption_key.sign(OpenSSL::Digest::SHA256.new, id_string))
    end

    def encryption_key
      signer.private_key
    end
  end
end


