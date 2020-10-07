class DropTypeVehicle < ActiveRecord::Migration[6.0]
  def change
  	drop_table :type_vehicles
  end
end
