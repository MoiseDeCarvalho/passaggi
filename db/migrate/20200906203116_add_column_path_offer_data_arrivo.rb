class AddColumnPathOfferDataArrivo < ActiveRecord::Migration[6.0]
  def change
  	add_column :path_offers, :data_arrivo, :string
  	add_column :path_offers, :ora_arrivo, :string
  end
end
