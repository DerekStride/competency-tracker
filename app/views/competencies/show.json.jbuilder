json.extract! @competency, :id, :topic, :created_at, :updated_at, :name, :proficiency
json.url competency_url(@competency, format: :json)
json.prerequisites @competency.prerequisites do |prerequisite|
  json.id prerequisite.id
  json.name prerequisite.name
  json.proficiency prerequisite.proficiency
  json.url competency_url(prerequisite, format: :json)
end
json.postrequisites @competency.postrequisites do |postrequisite|
  json.id postrequisite.id
  json.name postrequisite.name
  json.proficiency postrequisite.proficiency
  json.url competency_url(postrequisite, format: :json)
end
json.subtopics @competency.subtopics do |subtopic|
  json.id subtopic.id
  json.name subtopic.name
  json.proficiency subtopic.proficiency
  json.url competency_url(subtopic, format: :json)
end
