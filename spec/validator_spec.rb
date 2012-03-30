require 'spec_helper'

describe WhoGrantSig::Validator do
  before do
    headers = 
    @maxwell = FakeUser.new
    WhoGrantSig::Validator.any_instance.stub(:find_author).and_return(@maxwell)
    @headers = WhoGrantSig::Header.new(@maxwell)
    @validator = WhoGrantSig::Validator.new(@headers.email_identifier, @headers.valid_until, @headers.signature)
  end

  it 'seems to work reasonably' do
    @validator.should be_verified
  end
end