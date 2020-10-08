class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.integer :conversation
      t.integer :music
      t.integer :smoke
      t.integer :animal

      t.timestamps
    end
  end
end
