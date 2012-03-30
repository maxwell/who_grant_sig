
module WhoGrantSig
  class Header
    attr_accessor :user, :email_identifer

    def initialize(user)
      self.user = user
      self.email_identifer = self.user.email_identifer
    end

    def from_header
      "from: #{email_identifer}"
    end 

    def signature_header
      "X-WhoGrantSig-signature: #{id_signature}"
    end

    def time_header
      "X-WhoGrantSig-valid-until: #{time}"
    end

    def vaild_until_timestamp
      @time ||= (Time.now + 5.minutes).to_s
    end

    def id_string
      [diaspora_id, vaild_until_timestamp].join(',')
    end


    #where should I base64?
    def id_hash_signature
      encryption_key.sign(OpenSSL::Digest::SHA256.new, id_string)
    end

    def encryption_key
      user.encryption_key
    end
  end
end


