class ProfessionsController < ApplicationController
  def index

    @professions = Profession.all

    if params[:city_id]
      @city_id = params[:city_id]
    end

    respond_to do |format|
      format.html
      format.json {render json: @professions}
    end
  end

end
