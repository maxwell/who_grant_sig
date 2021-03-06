require "who_grant_sig/version"
require 'openssl'
require "base64"

require 'who_grant_sig/header'
require 'who_grant_sig/validator'
require 'who_grant_sig/who_grant_sig_middleware'
require 'who_grant_sig/client'

module WhoGrantSig
  TIME_THRESHOLD = 60 * 5 # 5 minutes
  TIME_HEADER = 'X-WhoGrantSig-valid-until'
  SIGNATURE_HEADER = 'X-WhoGrantSig-signature'
  FROM_HEADER = 'from'
end