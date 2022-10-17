class AdvancedSearchesController < ApplicationController
  def index
    @advanced_search = AdvancedSearch.new() 
  end

  def search
    # Set the previous search
    session[:previous_search] = advanced_search_params

    advanced_search = AdvancedSearch.new(advanced_search_params)
    @results = advanced_search.search
  end

  def show
    Current.previous_search = session[:previous_search]
    @user = User.find(params[:id])
  end

  private
    def advanced_search_params
      params.permit(:first_name, :last_name, :major_id, :graduation_year, :job_category_id, :job_title, :employer)
    end
end