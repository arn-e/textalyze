require './lib/web_parser.rb'
require './lib/text_processor.rb'

class Document < ActiveRecord::Base
  include WebHandler
  include TextProcessor

  attr_accessible :author, :body, :submitted_by, :title, :url, :word_count, :word_frequency, :rid_analysis
  
  def self.new_http_request(url)
    WebHandler.url_validity_check(url) == false ? (return 'Invalid URL') : true 
    WebHandler.data_from_url(url)
  end

  def self.parse_http_body(body)
    doc = Nokogiri::HTML(body)
    doc.text
  end
  
  def self.new_document(body)
    new_doc = Document.new
    new_doc.body = parse_http_body(parse_http_body(body))
    new_doc.word_count = TextProcessor.word_count(parse_http_body(body))
    new_doc.word_frequency = TextProcessor.word_frequency(parse_http_body(body)).to_json
    new_doc.rid_analysis = TextProcessor.rid_analysis(parse_http_body(body))
    new_doc.save!
  end

end
