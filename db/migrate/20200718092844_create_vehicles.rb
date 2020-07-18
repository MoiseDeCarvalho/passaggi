class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.integer :user_id
      t.integer :type_vechicle_id
      t.string :brand
      t.string :model
      t.string :motor
      t.string :colour

      t.timestamps
    end
  end
end
