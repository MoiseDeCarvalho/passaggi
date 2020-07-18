class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.boolean :conversation
      t.boolean :smoke
      t.boolean :animal
      t.boolean :music

      t.timestamps
    end
  end
end