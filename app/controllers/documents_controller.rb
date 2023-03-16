class DocumentsController < ApplicationController
  def index
    @documents = policy_scope(Document)
  end

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)
    authorize @document
    if @document.save
      redirect_to documents_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def document_params
    params.require(:document).permit(:name, :description, :pet_id, files: [])
  end
end
