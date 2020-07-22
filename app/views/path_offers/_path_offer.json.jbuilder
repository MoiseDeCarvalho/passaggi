json.extract! path_offer, :id, :vehicle_id, :user_id, :departure, :arrive, :date_departure, :date_arrive, :price, :max_available, :booked, :full, :created_at, :updated_at
json.url path_offer_url(path_offer, format: :json)
