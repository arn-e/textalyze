class DocumentsController < ApplicationController

  def new

  end

  def show
    @document = Document.find(params[:id])
  end

  def index
    @docs = Document.all
  end

  def create
    Document.new_document(params[:text_body])
    @document = Document.last
  end

end
