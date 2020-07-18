class AddAttachmentPhoto1ToVehicles < ActiveRecord::Migration[4.2]
  def self.up
    change_table :vehicles do |t|
      t.attachment :photo_1
    end
  end

  def self.down
    remove_attachment :vehicles, :photo_1
  end
end
