class Document < ActiveRecord::Base
  attr_accessible :author, :body, :submitted_by, :title
end
