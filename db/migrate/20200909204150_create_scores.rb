class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :user_id
      t.string :integer
      t.float :score
      t.integer :count
      t.integer :total

      t.timestamps
    end
  end
end
