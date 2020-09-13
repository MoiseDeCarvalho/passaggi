class AddColumnMessagesRead < ActiveRecord::Migration[6.0]
  def change
  	add_column :messages, :read, :integer, deafult: 0
  end
end
