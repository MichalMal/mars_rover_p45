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
  def edit; end

  # POST /mars_rovers
  def create
    @mars_rover = MarsRover.new(mars_rover_params)
    if @mars_rover.save

      if @mars_rover.x_coordinate < 0 || @mars_rover.x_coordinate > 12 || @mars_rover.y_coordinate < 0 || @mars_rover.y_coordinate > 10 # this is to check if the rover fell off the edge
        redirect_to mars_rovers_url, notice: "Mars rover #{@mars_rover.name} got destroyed"
        @mars_rover.destroy
        return
      end

      redirect_to mars_rovers_url, notice: "Mars rover #{@mars_rover.name} was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /mars_rovers/1
  def update
    if @mars_rover.update(mars_rover_params)
      @bearing = @mars_rover.orientation
      @x = 0
      @y = 0

      @mars_rover.course.upcase.each_char do |char|
        case char
        when 'F' # wants to go forward
          if @bearing == 'N'
            @y += 1
            next
          elsif @bearing == 'E'
            @x += 1
            next
          elsif @bearing == 'S'
            @y -= 1
            next
          elsif @bearing == 'W'
            @x -= 1
            next
          end
        when 'L' # wants to go left
          if @bearing == 'N'
            @bearing = 'W'
            next
          elsif @bearing == 'E'
            @bearing = 'N'
            next
          elsif @bearing == 'S'
            @bearing = 'E'
            next
          elsif @bearing == 'W'
            @bearing = 'S'
            next
          end
        when 'R' # wants to go right
          if @bearing == 'W'
            @bearing = 'N'
            next
          elsif @bearing == 'S'
            @bearing = 'W'
            next
          elsif @bearing == 'E'
            @bearing = 'S'
            next
          elsif @bearing == 'N'
            @bearing = 'E'
            next
          end
        else
          puts 'SOMETHING WENT WRONG'
        end
        puts 'This is the value of Y:' + @y.to_s
      end

      @mars_rover.y_coordinate += @y
      @mars_rover.x_coordinate += @x
      @mars_rover.orientation = @bearing

      if @mars_rover.x_coordinate < 0 || @mars_rover.x_coordinate > 12 || @mars_rover.y_coordinate < 0 || @mars_rover.y_coordinate > 10 # this is to check if the rover fell off the edge
        redirect_to mars_rovers_url, notice: "Mars rover #{@mars_rover.name} got destroyed"
        @mars_rover.destroy
        return
      end
      @mars_rover.course = ""
      @mars_rover.save

      redirect_to mars_rovers_url, notice: "Mars rover #{@mars_rover.name} was successfully moved"
    else
      render :edit
    end
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
    params.require(:mars_rover).permit(:name, :x_coordinate, :y_coordinate, :orientation, :course)
  end
end
