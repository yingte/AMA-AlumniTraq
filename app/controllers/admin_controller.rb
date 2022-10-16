class AdminController < ApplicationController
  before_action :check_authority, only: %i[ index ]
  def create
  end

  def index
    @users = User.where.not(id: session[:user_id])
  end

  def approve
    @user = User.find(Integer(approval_param[:user_id]))
    if @user.update(is_approved: true)
      respond_to do |format|
        format.html { redirect_to admin_index_path, notice: "User approved." }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_index_path, notice: "User could not be approved." }
      end
    end
  end
  private
    def approval_param
      params.require(:user).permit(:user_id, :role, :is_approved)
    end
  end
