class DocumentsController < ApplicationController

  def index
  end

  def create
    Document.new_document("","",params[:body],"","")
    @document = Document.last
  end

end
