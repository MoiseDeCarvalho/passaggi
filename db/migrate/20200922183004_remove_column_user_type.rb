class RemoveColumnUserType < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :type, :integer, default: 0
  end
end
