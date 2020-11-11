class MarsRoversController < ApplicationController
  before_action :set_mars_rover, only: [:show, :edit, :update, :destroy]

  # GET /mars_rovers
  # GET /mars_rovers.json
  def index
    @mars_rovers = MarsRover.all
  end

  # GET /mars_rovers/1
  # GET /mars_rovers/1.json
  def show
  end

  # GET /mars_rovers/new
  def new
    @mars_rover = MarsRover.new
  end

  # GET /mars_rovers/1/edit
  def edit
  end

  # POST /mars_rovers
  # POST /mars_rovers.json
  def create
    @mars_rover = MarsRover.new(mars_rover_params)

    respond_to do |format|
      if @mars_rover.save
        format.html { redirect_to @mars_rover, notice: 'Mars rover was successfully created.' }
        format.json { render :show, status: :created, location: @mars_rover }
      else
        format.html { render :new }
        format.json { render json: @mars_rover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mars_rovers/1
  # PATCH/PUT /mars_rovers/1.json
  def update
    respond_to do |format|
      if @mars_rover.update(mars_rover_params)
        format.html { redirect_to @mars_rover, notice: 'Mars rover was successfully updated.' }
        format.json { render :show, status: :ok, location: @mars_rover }
      else
        format.html { render :edit }
        format.json { render json: @mars_rover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mars_rovers/1
  # DELETE /mars_rovers/1.json
  def destroy
    @mars_rover.destroy
    respond_to do |format|
      format.html { redirect_to mars_rovers_url, notice: 'Mars rover was successfully destroyed.' }
      format.json { head :no_content }
    end
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
