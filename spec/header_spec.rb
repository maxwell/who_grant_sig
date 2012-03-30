require 'spec_helper'

describe WhoGrantSig::Header do
  before do
    @maxwell = FakeUser.new
    @header = WhoGrantSig::Header.new(@maxwell)
  end

  describe '#grant' do
    it 'puts out a hash that can be given to javascript' do
      @header.grant.should be_a Hash
      @header.grant.should_not be_empty
    end
  end
end