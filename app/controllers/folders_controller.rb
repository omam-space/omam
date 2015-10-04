class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  def index
    @folders = Folder.all
  end

  # GET /folders/1
  def show
  end

  # POST /folders
  def create
    @folder = Folder.new(folder_params)
    
    if @folder.save
      render json: :show, status: :created, location: @folder
    else
      render json: @folder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /folders/1
  def update
    if @folder.update(folder_params)
      render json: :show, status: :ok, location: @folder
    else
      render json: @folder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /folders/1
  def destroy
    @folder.destroy

    render json: { head: :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name, :folder_id, :volume_id)
    end
end
