class AlumniController < ApplicationController
  before_action :set_alumnus, only: %i[ show edit update destroy ]
  before_action :check_admin_authority, only: %i[ index destroy ]
  before_action :check_alum_authority, only: %i[ show new edit create update ]

  # GET /alumni or /alumni.json
  def index
    @alumni = Alumnus.all
  end

  # GET /alumni/1 or /alumni/1.json
  def show
  end

  # GET /alumni/new
  def new
    @alumnus = Alumnus.new
  end

  # GET /alumni/1/edit
  def edit
  end

  # POST /alumni or /alumni.json
  def create
    # CHANGE DEFAULT BEHAVIOR #
    # Add functionality to create new employer if does not already exist
    @alumnus = Alumnus.new(alumnus_params)

    respond_to do |format|
      if @alumnus.save
        format.html { redirect_to alumnus_url(@alumnus), notice: "Alumnus was successfully created." }
        format.json { render :show, status: :created, location: @alumnus }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alumnus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alumni/1 or /alumni/1.json
  def update
    respond_to do |format|
      if @alumnus.update(alumnus_params)
        format.html { redirect_to alumnus_url(@alumnus), notice: "Alumnus was successfully updated." }
        format.json { render :show, status: :ok, location: @alumnus }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alumnus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumni/1 or /alumni/1.json
  def destroy
    @alumnus.destroy

    respond_to do |format|
      format.html { redirect_to alumni_url, notice: "Alumnus was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumnus
      @alumnus = Alumnus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alumnus_params
      params.require(:alumnus).permit(:user_id, :bio, :job_title, :job_category_id, :employer, :availability)
    end

    def check_admin_authority
      if Current.user.role.id != 1
        render_401()
      end
    end
  
    def check_alum_authority
      if Current.user.role.id != 1 && Current.user.role.id != 3
        render_401()
      end
    end
end
