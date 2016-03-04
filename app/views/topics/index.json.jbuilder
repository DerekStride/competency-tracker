json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :competency, :created_at, :updated_at
  json.url topic_url(topic, format: :json)
end
