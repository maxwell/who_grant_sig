require 'spec_helper'

describe WhoGrantSig::Validator do
  before do
    @maxwell = FakeUser.new
    WhoGrantSig::Validator.any_instance.stub(:find_author).and_return(@maxwell)
    @header = WhoGrantSig::Header.new(@maxwell)

  end

  it 'seems to work reasonably' do
    validator = WhoGrantSig::Validator.new(@header.grant)
    validator.verify!
    validator.should be_verified
  end

  context 'not valid' do
    it 'if the grant is too old NOTE: DUMB TEST' do
      pending "need to make a valid grant from back in time"
    end

    it 'if the sigature has been messed with' do
      validator = WhoGrantSig::Validator.new(@header.grant.merge(WhoGrantSig::SIGNATURE_HEADER => 'sdfssfd'))
      validator.should_not be_verified
    end
  end
end