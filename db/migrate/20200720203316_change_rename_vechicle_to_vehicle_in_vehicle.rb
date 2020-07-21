class ChangeRenameVechicleToVehicleInVehicle < ActiveRecord::Migration[6.0]
  def change
  	rename_column :vehicles, :type_vechicle_id, :type_vehicle_id 
  end
end
