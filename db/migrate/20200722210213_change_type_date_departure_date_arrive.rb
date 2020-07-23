class ChangeTypeDateDepartureDateArrive < ActiveRecord::Migration[6.0]
  def change
  	change_column :path_offers, :date_departure, :date
  	change_column :path_offers, :date_arrive, :date

  end
end
