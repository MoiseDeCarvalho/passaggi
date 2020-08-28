class AddColumnFeedbackPath < ActiveRecord::Migration[6.0]
  def change
  	add_column :feedback_paths, :booked, :integer
  end
end
