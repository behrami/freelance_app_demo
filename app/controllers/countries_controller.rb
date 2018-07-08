class CountriesController < ApplicationController
  def index
    @countries = Country.all

    if  params[:profession_id]
      @profession_id = params[:profession_id]
    end

    respond_to do |format|
      format.html
      format.json {render json: @countries}
    end
  end

end
