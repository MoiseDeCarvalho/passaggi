class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :dest_user_id
      t.string :integer
      t.string :title
      t.string :message
      t.string :string
      t.integer :reply_to_id

      t.timestamps
    end
  end
end
