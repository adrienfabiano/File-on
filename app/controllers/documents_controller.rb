class DocumentsController < ApplicationController



  def index
  end

  def new
    @document = Document.new
    @tags = Tag.all
  end

  def create
    @document = current_user.documents.build(document_params)
    @document.save
    flash[:notice] = "Votre document a bien été ajouté à votre librairie"
    if @document.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    set_document
  end

  def edit
  end

  def update
  end

  def destroy
    @document = set_document
    @document.destroy
    redirect_to root_path
  end

  private

  def document_params
    params.require(:document).permit(:tag_id, :document_date, :photo)
  end

  def set_document
    @document = Document.find(params[:id])
  end

end


