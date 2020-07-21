class Vehicle < ApplicationRecord
	belongs_to :user
	def typeVehicle
      return TypeVehicle.all #-> returns first instance of `OtherModel` & then displays "name"
   	end

   	has_attached_file :photo_1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo_1, content_type: /\Aimage\/.*\z/

	has_attached_file :photo_2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo_2, content_type: /\Aimage\/.*\z/
end
