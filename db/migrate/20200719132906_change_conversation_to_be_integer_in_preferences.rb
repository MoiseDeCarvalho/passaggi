class ChangeConversationToBeIntegerInPreferences < ActiveRecord::Migration[6.0]
  def change
  	  change_column :preferences, :conversation, :integer
  	  change_column :preferences, :music, :integer
  	  change_column :preferences, :smoke, :integer
  	  change_column :preferences, :animal, :integer
  end
end
