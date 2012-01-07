require 'spec_helper'

describe "OmniAuth::Strategies::ConstantContact" do
  subject do
    OmniAuth::Strategies::ConstantContact.new(nil, @options || {})
  end

  it 'should add a camelization for itself' do
    OmniAuth::Utils.camelize('constantcontact').should == 'ConstantContact'
  end

  context 'client options' do
    it 'has correct ConstantContact site' do
      subject.options.client_options.site.should eq('https://oauth.constantcontact.com')
    end

    it 'has correct request token path' do
      subject.options.client_options.request_token_path.should eq('/ws/oauth/request_token')
    end

    it 'has correct access token path' do
      subject.options.client_options.access_token_path.should eq('/ws/oauth/access_token')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_path.should eq('/ws/oauth/confirm_access')
    end
  end

  context '#uid' do
    before :each do
      subject.stub(:raw_info) { { 'id' => '123' } }
    end

    it 'returns the id from raw_info' do
      subject.uid.should eq('123')
    end
  end
end