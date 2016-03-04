json.array!(@learnables) do |learnable|
  json.extract! learnable, :id, :type, :name, :proficiency, :learning_sources, :tags, :prerequisites, :created_at, :updated_at, :competency
end
