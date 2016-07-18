require 'net/http'
require 'rest-client'
require 'json'
require 'pry-byebug'
require 'pp'

json = JSON.parse(File.read('sampledata.json'), symbolize_names: true)

# "Context-free grammars (cross-reference PL/Syntax Analysis)": {
#
#   "subArea": "Basic Automata Computability and Complexity",
#   "type": "tier2",
#   "area": "Algorithms and Complexity"
# }

uri = 'http://localhost:3000'
tags_uri = "#{uri}/tags"
competencies_uri = "#{uri}/competencies"
topics_uri = "#{uri}/topics"

def competency_id_from_name(name)
  resp = RestClient.get 'http://competency-tracking.herokuapp.com/competencies.json'
  competencies = JSON.parse(resp)
  comp = competencies.find { |t| t['name'] == name }
  comp['id'] if comp
end

root_competency = 'ACM'
resp = RestClient.post 'http://competency-tracking.herokuapp.com/competencies.json', competency: { name: root_competency }

acm = JSON.parse(resp)

# binding.pry

json[:knowledgeAreas].each do |topic, values|
  RestClient.post 'http://competency-tracking.herokuapp.com/competencies.json', competency: { name: topic, competency_id: acm['id'] }
end

json[:competencies].map { |comp, h| [h[:subArea], h[:area]] }.uniq.each do |areas|
  RestClient.post 'http://competency-tracking.herokuapp.com/competencies.json', competency: { name: areas.first, competency_id: competency_id_from_name(areas.last) }
end

json[:competencies].map { |comp, h| [comp, h[:subArea]] }.uniq.each do |areas|
  RestClient.post 'http://competency-tracking.herokuapp.com/competencies.json', competency: { name: areas.first, competency_id: competency_id_from_name(areas.last) }
end
