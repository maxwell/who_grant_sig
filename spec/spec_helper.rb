$:.unshift File.dirname(__FILE__) + '/../lib'
require 'who_grant_sig'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

class FakeUser
  attr_accessor :key, :diaspora_handle
  def initialize
    self.key = new_key
    self.diaspora_handle = "maxwell@joindiaspora.com"
  end

  def new_key
    @key ||= OpenSSL::PKey::RSA::generate(512)
  end

  def public_key
    key.public_key
  end

  def private_key 
    key.private_key
  end
end