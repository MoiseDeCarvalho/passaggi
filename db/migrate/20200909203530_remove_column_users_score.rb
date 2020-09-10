class RemoveColumnUsersScore < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :score, :float
   
  end
end
