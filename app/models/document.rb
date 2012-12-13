class Document < ActiveRecord::Base
  attr_accessible :author, :body, :submitted_by, :title, :url
  
  def self.new_http_request(url)

  end

end
