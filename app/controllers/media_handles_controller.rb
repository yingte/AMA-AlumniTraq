class MediaHandlesController < ApplicationController
  before_action :set_media_handle, only: %i[ show edit update destroy ]

  # GET /media_handles or /media_handles.json
  def index
    @media_handles = MediaHandle.all
  end

  # GET /media_handles/1 or /media_handles/1.json
  def show
  end

  # GET /media_handles/new
  def new
    @media_handle = MediaHandle.new
  end

  # GET /media_handles/1/edit
  def edit
  end

  # POST /media_handles or /media_handles.json
  def create
    @media_handle = MediaHandle.new(media_handle_params)

    respond_to do |format|
      if @media_handle.save
        format.html { redirect_to media_handle_url(@media_handle), notice: "Media handle was successfully created." }
        format.json { render :show, status: :created, location: @media_handle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @media_handle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_handles/1 or /media_handles/1.json
  def update
    respond_to do |format|
      if @media_handle.update(media_handle_params)
        format.html { redirect_to media_handle_url(@media_handle), notice: "Media handle was successfully updated." }
        format.json { render :show, status: :ok, location: @media_handle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @media_handle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_handles/1 or /media_handles/1.json
  def destroy
    @media_handle.destroy

    respond_to do |format|
      format.html { redirect_to media_handles_url, notice: "Media handle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_handle
      @media_handle = MediaHandle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def media_handle_params
      params.require(:media_handle).permit(:alumnus_id, :platform, :link)
    end
end
