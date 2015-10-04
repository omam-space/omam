class VolumesController < ApplicationController
  before_action :set_volume, only: [:show, :edit, :update, :destroy]

  # GET /volumes
  def index
    @volumes = Volume.all
  end

  # GET /volumes/1
  def show
  end

  # GET /volumes/new
  def new
    @volume = Volume.new
  end

  # GET /volumes/1/edit
  def edit
  end

  # POST /volumes
  def create
    @volume = Volume.new(volume_params)

    if @volume.save
      render json: :show, status: :created, location: @volume
    else
      render json: @volume.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /volumes/1
  def update
    if @volume.update(volume_params)
      render json: :show, status: :ok, location: @volume
    else
      render json: @volume.errors, status: :unprocessable_entity
    end
  end

  # DELETE /volumes/1
  def destroy
    @volume.destroy

    render json: { head: :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volume
      @volume = Volume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volume_params
      params.require(:volume).permit(:label, :address)
    end
end
