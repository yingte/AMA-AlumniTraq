class SearchesController < ApplicationController

    def new
        @search = Search.new
        
    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end

    def show
        @search = Search.find(params[:id])
        # @search_info = Alumnus.where('user_id = ' + String(params[:id])).first

    end

    private

    def search_params
        puts(params[:major])
        params.require(:search).permit(:first_name, :last_name, :major, :graduation_year, :job_title, :employer)
    end
end