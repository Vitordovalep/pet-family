class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show edit update destroy]

  def index
    @documents = policy_scope(Document)
  end

  def show
    authorize @document
  end

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)
    authorize @document
    if @document.save
      redirect_to document_path(@document), notice: "O seu documento foi criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @document
  end

  def update
    authorize @document
    if @document.update(document_params)
      redirect_to document_path(@document), notice: "O seu documento foi atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @document
    @document.destroy
    redirect_to documents_path
  end

  private

  def document_params
    params.require(:document).permit(:name, :description, :pet_id, files: [])
  end

  def set_document
    @document = Document.find(params[:id])
  end
end
