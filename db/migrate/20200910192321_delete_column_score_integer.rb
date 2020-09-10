class DeleteColumnScoreInteger < ActiveRecord::Migration[6.0]
  def change
  	remove_column :scores, :integer, :string
  end
end
