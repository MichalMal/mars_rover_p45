class AddCourseToMarsRovers < ActiveRecord::Migration[6.0]
  def change
    add_column :mars_rovers, :course, :string
  end
end
