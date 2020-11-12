# frozen_string_literal: true

class MarsRoversController < ApplicationController
  before_action :set_mars_rover, only: %i[show edit update destroy]

  # GET /mars_rovers
  def index
    @mars_rovers = MarsRover.all
  end

  # GET /mars_rovers/1
  # def show
  # end

  # GET /mars_rovers/new
  def new
    @mars_rover = MarsRover.new
  end

  # GET /mars_rovers/1/edit
  def edit
  end

  # POST /mars_rovers
  def create
    @mars_rover = MarsRover.new(mars_rover_params)
    redirect_to mars_rovers_url, notice: 'Mars rover was successfully created.'
  end

  # PATCH/PUT /mars_rovers/1
  def update
    redirect_to mars_rovers_url, notice: 'Mars rover was successfully moved'
  end

  # DELETE /mars_rovers/1
  def destroy
    @mars_rover.destroy

    redirect_to mars_rovers_url, notice: 'Mars rover was destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mars_rover
    @mars_rover = MarsRover.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mars_rover_params
    params.require(:mars_rover).permit(:name, :x_coordinate, :y_coordinate, :orientation)
  end
end
