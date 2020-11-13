class CreateMarsRovers < ActiveRecord::Migration[6.0]
  def change
    create_table :mars_rovers do |t|
      t.string :name
      t.integer :x_coordinate
      t.string :y_coordinate
      t.string :orientation

      t.timestamps
    end
  end
end
