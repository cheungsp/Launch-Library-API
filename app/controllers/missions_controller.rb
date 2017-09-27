require 'rubygems'
require 'httparty'

class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :update, :destroy]

  response = HTTParty.get('https://launchlibrary.net/1.2/launch/next/10')
  LAUNCHES = response.parsed_response["launches"]

  # GET /missions
  def index
  render json: {status: :ok, data: LAUNCHES}
end

  def show
    render json: @mission
  end

  # POST /missions
  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      render json: @mission, status: :created, location: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /missions/1
  def update
    if @mission.update(mission_params)
      render json: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /missions/1
  def destroy
    @mission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mission_params
      params.fetch(:mission, {})
    end
end
