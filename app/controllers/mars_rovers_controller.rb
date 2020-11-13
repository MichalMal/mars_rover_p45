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





    @bearing = @rover.bearing
    @x = 0
    @y = 0

    @navigation[:course].each_char do |char|
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
        puts 'SOMETHING WENT WRONG BRO!!!!!!!!!' # sorry for it being obnoxious but i do need to see it on the logs just to check where the program is going
      end
      puts 'This is the value of Y:' + @y.to_s
    end
    puts 'This is the value of Y :' + @y.to_s
    puts 'CALL THE UPDATE METHOD!!!!'




    @rover.y = @rover[:y] + @y
    @rover.x = @rover[:x] + @x
    @rover.bearing = @bearing
    @rover.save
    
    puts 'This is the NEW value of X:' + @x.to_s
    puts 'This is the NEW value of Y:' + @y.to_s
  









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
