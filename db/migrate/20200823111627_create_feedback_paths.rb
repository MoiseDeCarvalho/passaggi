class CreateFeedbackPaths < ActiveRecord::Migration[6.0]
  def change
    create_table :feedback_paths do |t|
      t.integer :user_id
      t.integer :path_offers_id

      t.timestamps
    end
  end
end
