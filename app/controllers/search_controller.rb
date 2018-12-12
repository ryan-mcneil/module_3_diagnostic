class SearchController < ApplicationController
  def index
    @facade = StationFacade.new(params[:q])
  end
end
