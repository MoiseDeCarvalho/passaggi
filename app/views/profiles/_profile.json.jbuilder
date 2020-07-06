json.extract! profile, :id, :name, :surname, :address, :city, :mobile, :description, :created_at, :updated_at
json.url profile_url(profile, format: :json)
