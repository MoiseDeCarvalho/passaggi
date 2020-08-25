class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :id_feedback
      t.integer :path_offers_id
      t.integer :user_id
      t.text :feedback
      t.integer :score

      t.timestamps
    end
  end
end
