class BasicSearchesController < ApplicationController
    def index
        @basic_search = BasicSearch.new()
    end

    def search
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
        @user = User.find(params[:id])
    end

end
