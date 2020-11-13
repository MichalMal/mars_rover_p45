class ChangeDataTypeForYOrientation < ActiveRecord::Migration[6.0]
  def change
    change_column :mars_rovers, :y_coordinate, :integer
  end
end
