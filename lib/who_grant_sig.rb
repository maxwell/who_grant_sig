require "who_grant_sig/version"
require 'openssl'

require 'who_grant_sig/header'
require 'who_grant_sig/validator'

module WhoGrantSig
  TIME_THRESHOLD = 60 * 5 # 5 minutes
end