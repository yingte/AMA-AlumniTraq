class EventAttendeesController < ApplicationController
  before_action :set_event_attendee, only: %i[ show edit update destroy ]
  before_action :check_attendees_authority, only: %i[ new edit create update ]

  # GET /event_attendees or /event_attendees.json
  def index
    @event_attendees = EventAttendee.all
  end

  # GET /event_attendees/1 or /event_attendees/1.json
  def show
  end

  # GET /event_attendees/new
  def new
    @event_attendee = EventAttendee.new
  end

  # GET /event_attendees/1/edit
  def edit
  end

  # POST /event_attendees or /event_attendees.json
  def create
    @event_attendee = EventAttendee.new(event_attendee_params)

    respond_to do |format|
      if @event_attendee.save
        format.html { redirect_to event_attendee_url(@event_attendee), notice: "Event attendee was successfully created." }
        format.json { render :show, status: :created, location: @event_attendee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_attendees/1 or /event_attendees/1.json
  def update
    respond_to do |format|
      if @event_attendee.update(event_attendee_params)
        format.html { redirect_to event_attendee_url(@event_attendee), notice: "Event attendee was successfully updated." }
        format.json { render :show, status: :ok, location: @event_attendee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_attendees/1 or /event_attendees/1.json
  def destroy
    @event_attendee.destroy

    respond_to do |format|
      format.html { redirect_to event_attendees_url, notice: "Event attendee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_attendee
      @event_attendee = EventAttendee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_attendee_params
      params.require(:event_attendee).permit(:event_id, :user_id)
    end

    def check_attendees_authority
      # Allow admin or event planner to write to calendar
      if Current.user.role.id != 1 && Current.user.role.id != 4
        render_401()
      end
    end
end
