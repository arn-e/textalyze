require './lib/web_parser.rb'
require './lib/text_processor.rb'

class Document < ActiveRecord::Base
  include WebHandler
  include TextProcessor

  attr_accessible :author, :body, :submitted_by, :title, :url, :word_count, :word_frequency
  
  def self.new_http_request(url)
    WebHandler.url_validity_check(url) == false ? (return 'Invalid URL') : true 
    WebHandler.data_from_url(url)
  end

  def self.parse_http_body(body)
    doc = Nokogiri::HTML(body)
    doc.text
  end
  
  def self.new_document(author, title, body, submitted_by, url)
    new_doc = Document.new
    new_doc.author = author
    new_doc.title = title
    new_doc.body = body
    new_doc.submitted_by = submitted_by
    new_doc.url = url
    new_doc.word_count = TextProcessor.word_count(body)
    new_doc.word_frequency = TextProcessor.word_frequency(body)
    new_doc.save
  end

  def document_analysis

  end

end
