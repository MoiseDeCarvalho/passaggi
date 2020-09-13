json.extract! message, :id, :user_id, :dest_user_id, :integer, :title, :message, :string, :reply_to_id, :created_at, :updated_at
json.url message_url(message, format: :json)
