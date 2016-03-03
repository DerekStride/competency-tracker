json.array!(@competencies) do |competency|
  json.extract! competency, :id
  json.url competency_url(competency, format: :json)
end
