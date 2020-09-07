class AddColumnPathOfferDataOra < ActiveRecord::Migration[6.0]
  def change
  	add_column :path_offers, :data_partenza, :string
  	add_column :path_offers, :ora_partenza, :string
  end
end
