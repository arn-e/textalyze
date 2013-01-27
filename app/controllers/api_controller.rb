class ApiController < ApplicationController

  def show
    # respond with JSON ?
    # read JSON?
  end

  def create
    # read JSON?
    Document.new_document() # my parsed JSON here 
    @document = Document.last # respond with this, in JSON
  end

end
