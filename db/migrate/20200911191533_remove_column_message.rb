class RemoveColumnMessage < ActiveRecord::Migration[6.0]
  def change
  	remove_column :messages, :integer, :string
  	remove_column :messages, :string, :string
  end
end
