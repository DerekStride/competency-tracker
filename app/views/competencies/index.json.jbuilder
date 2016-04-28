json.array!(@competencies) do |competency|
  json.extract! competency, :id, :created_at, :updated_at, :name, :proficiency
  json.url competency_url(competency, format: :json)
  json.subtopics competency.subtopics, :id, :name
end
