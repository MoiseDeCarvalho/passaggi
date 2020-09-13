class RemovreCloumnMessages < ActiveRecord::Migration[6.0]
  def change
  	remove_column :messages, :reply_to_id, :integer
  	add_column :messages, :path_offer_id, :integer

  end
end
