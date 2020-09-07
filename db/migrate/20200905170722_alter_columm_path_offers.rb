class AlterColummPathOffers < ActiveRecord::Migration[6.0]
  def change
  	change_column :path_offers, :date_departure, :datetime
  	change_column :path_offers, :date_arrive, :datetime
  end
end
