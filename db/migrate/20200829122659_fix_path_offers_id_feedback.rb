class FixPathOffersIdFeedback < ActiveRecord::Migration[6.0]
  def change
  	rename_column :feedbacks, :path_offers_id, :path_offer_id
  end
end
