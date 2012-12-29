class DocumentsController < ApplicationController

  def index
  end

  def create
    Document.new_document(params[:text_body])
    @document = Document.last
  end

end
