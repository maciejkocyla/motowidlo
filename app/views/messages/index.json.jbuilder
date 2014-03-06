json.array!(@messages) do |message|
  json.extract! message, :id, :author_id, :recipient_id, :title, :content
  json.url message_url(message, format: :json)
end
