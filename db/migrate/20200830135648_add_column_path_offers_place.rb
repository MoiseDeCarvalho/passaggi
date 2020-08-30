class AddColumnPathOffersPlace < ActiveRecord::Migration[6.0]
  def change
  	add_column :path_offers, :place, :string
  end
end
