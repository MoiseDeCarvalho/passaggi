class FixPathOffersIdName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :feedback_paths, :path_offers_id, :path_offer_id
  end
end
