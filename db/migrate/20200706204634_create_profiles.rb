class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :city
      t.string :mobile
      t.text :description

      t.timestamps
    end
  end
end
