class DocumentsController < ApplicationController

  def index
    @docs = Document.all
  end

  def create
    Document.new_document(params[:text_body])
    @document = Document.last
  end

end
