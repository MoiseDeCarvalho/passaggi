class RenameColumnUserType < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :type_user, :integer, default: 0
  end
end
