class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    drop_table :preferences
    create_table :preferences do |t|
      t.integer :user_id
      t.boolean :conversation
      t.boolean :music
      t.boolean :smoke
      t.boolean :animal

      t.timestamps
    end
  end
end
