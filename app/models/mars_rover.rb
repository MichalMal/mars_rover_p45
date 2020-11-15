# frozen_string_literal: true

class MarsRover < ApplicationRecord
  validates :name, presence: true
  validates :x_coordinate, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  validates :y_coordinate, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  validates :orientation, presence: true, length: { maximum: 1 }

  enum orientations: {north: 'N', east: 'E', south: 'S', west: 'W'}
end
