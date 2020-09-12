class AddColumnMessages < ActiveRecord::Migration[6.0]
  def change
  	add_column :messages, :sender_name, :string
  	add_column :messages, :receiver_name, :string
  end
end
