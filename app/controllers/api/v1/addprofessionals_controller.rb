class Api::V1::AddprofessionalsController < ApplicationController
	def create
		render json: User.first
	end
end