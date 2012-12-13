require 'spec_helper'

describe Document do 
  describe '.new_http_request' do
    let(:fake_url) {"http://www.google.com/fizzbuzzyo"}

    context 'document provided via URL' do
      it 'returns an error when an invalid URL is passed' do
        Document.new_http_request(fake_url).should eql("Invalid URL")
      end

      it 'makes a HTTP request when a valid URL is passed'
    end
  end

    it 'retrieves the body of an HTTP request'

    it 'removes the HTML content if applicable'

    it 'stores the HTTP body in the database BODY column'


  context 'document provided via upload' do
  end

end