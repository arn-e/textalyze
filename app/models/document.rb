require './lib/web_parser.rb'

class Document < ActiveRecord::Base
  include WebHandler

  attr_accessible :author, :body, :submitted_by, :title, :url
  
  def self.new_http_request(url)
    return 'Invalid URL' if WebHandler.url_validity_check(url) == false

  end

end
