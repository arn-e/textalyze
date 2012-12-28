require 'spec_helper'

describe Document do 

  describe '.new_http_request' do
    let(:fake_url) {"http://www.google.com/fizzbuzzyo"}

    context 'document provided via URL' do
      # it 'returns an error when an invalid URL is passed' do
      #   Document.new_http_request(fake_url).should eql("Invalid URL")
      # end
    end

  end

  describe '.parse_http_body' do
    let(:mock_body) {"<body>A body with ale, absinthium and burping</body>"}
    let(:mock_body_stripped) {"A body with ale, absinthium and burping"}

    it 'removes HTML tags from the body' do
      Document.parse_http_body(mock_body).should eql(mock_body_stripped)
    end
  end

  describe '.new_document' do
    let(:mock_body) {"<body>A body with ale, absinthium and burping</body>"}
    before(:each) {Document.new_document(mock_body)}
    before(:each) { @base_count = Document.count }
    
    it 'creates a new document' do
      Document.new_document(mock_body)
      Document.count.should eql(@base_count + 1)
    end

    it 'stores a single value as the word count' do
      doc = Document.last
      doc.word_count.to_s.length.should eql(1)
    end

    it 'evaluates the word count correctly'

    it 'returns a delimited list of word categories'

  end  

end