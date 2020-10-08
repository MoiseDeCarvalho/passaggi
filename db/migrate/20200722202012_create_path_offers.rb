class CreatePathOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :path_offers do |t|
      t.integer :vehicle_id
      t.integer :user_id
      t.string :departure
      t.string :arrive
      t.timestamp :date_departure
      t.timestamp :date_arrive
      t.float :price
      t.integer :max_available
      t.integer :booked
      t.integer :full

      t.timestamps
    end
  end
end
