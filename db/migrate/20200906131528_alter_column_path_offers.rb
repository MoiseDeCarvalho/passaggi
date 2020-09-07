class AlterColumnPathOffers < ActiveRecord::Migration[6.0]
  def change
  	change_column :path_offers, :date_departure, :timestamp
  end
end
