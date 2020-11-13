# frozen_string_literal: true

class MarsRover < ApplicationRecord
  validates :name, presence: true, length: { minimum: 8 }
  validates :x_coordinate, presence: true, length: { maximum: 2 }
  validates :y_coordinate, presence: true, length: { maximum: 2 }
  validates :orientation, presence: true, length: { maximum: 1 }

  def make_uppercase
    course.upcase!
    end

  enum orientations: [:north, :east, :south, :west]
end
