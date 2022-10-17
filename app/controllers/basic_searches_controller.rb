class BasicSearchesController < ApplicationController
  def index
    @basic_search = BasicSearch.new()
  end

  def search
    # Set the previous search
    session[:previous_search] = params[:keyword]
    
    # If doing keyword search, apply query
    if params[:keyword].present?
        basic_search = BasicSearch.new(keyword: params[:keyword])
        @results = basic_search.search
    else
        # Sort all the alumni
        @results = User.alumni_users.order(:last_name)
    end
  end

  def show
    Current.previous_search = session[:previous_search]
    @user = User.find(params[:id])
  end

end
