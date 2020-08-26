class RemoveIdFeedbackFromFeedback < ActiveRecord::Migration[6.0]
  def change
    remove_column :feedbacks, :id_feedback, :integer
  end
end
