class CalendareventsController < ApplicationController
  before_action :set_calendarevent, only: %i[ show edit update destroy ]

  # GET /calendarevents or /calendarevents.json
  def index
    @calendarevents = Calendarevent.all
  end

  # GET /calendarevents/1 or /calendarevents/1.json
  def show
  end

  # GET /calendarevents/new
  def new
    @calendarevent = Calendarevent.new
  end

  # GET /calendarevents/1/edit
  def edit
  end

  # POST /calendarevents or /calendarevents.json
  def create
    @calendarevent = Calendarevent.new(calendarevent_params)

    respond_to do |format|
      if @calendarevent.save
        format.html { redirect_to calendarevent_url(@calendarevent), notice: "Calendarevent was successfully created." }
        format.json { render :show, status: :created, location: @calendarevent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calendarevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendarevents/1 or /calendarevents/1.json
  def update
    respond_to do |format|
      if @calendarevent.update(calendarevent_params)
        format.html { redirect_to calendarevent_url(@calendarevent), notice: "Calendarevent was successfully updated." }
        format.json { render :show, status: :ok, location: @calendarevent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendarevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendarevents/1 or /calendarevents/1.json
  def destroy
    @calendarevent.destroy

    respond_to do |format|
      format.html { redirect_to calendarevents_url, notice: "Calendarevent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendarevent
      @calendarevent = Calendarevent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calendarevent_params
      params.permit(:title, :start, :end, :location)
    end
end
