class CreateTypeVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :type_vehicles do |t|
    	t.string :description
    	t.timestamps 
    end
  end
end
