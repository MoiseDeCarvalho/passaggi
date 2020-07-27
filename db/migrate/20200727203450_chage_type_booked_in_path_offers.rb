class ChageTypeBookedInPathOffers < ActiveRecord::Migration[6.0]
  def change
  	change_column :path_offers, :booked, :integer
  	change_column :path_offers, :full, :integer
  end
end
