json.array!(@competencies) do |competency|
  json.extract! competency, :id, :created_at, :updated_at, :name, :learnables
  json.url competency_url(competency, format: :json)
end
