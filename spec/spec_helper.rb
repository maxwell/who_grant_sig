$:.unshift File.dirname(__FILE__) + '/../lib'
require 'who_grant_sig'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

class FakeUser
  attr_accessor :key, :email_identifier
  def initialize
    self.key = new_key
    self.email_identifier = "maxwell@joindiaspora.com"
  end

  def new_key
    @key ||= OpenSSL::PKey::RSA::generate(512)
  end

  def public_key
    key.public_key
  end

  def private_key 
    key
  end
end