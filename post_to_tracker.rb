require 'net/http'
require 'rest-client'
require 'json'
require 'pry'
require 'pp'

@json = JSON.parse(File.read('sampledata.json'), symbolize_names: true)

# "Context-free grammars (cross-reference PL/Syntax Analysis)": {
#
#   "subArea": "Basic Automata Computability and Complexity",
#   "type": "tier2",
#   "area": "Algorithms and Complexity"
# }

uri = 'http://localhost:3000'
@tags_uri = "#{uri}/tags"
@competencies_uri = "#{uri}/competencies"
@topics_uri = "#{uri}/topics"

def latest_tags
  response = Net::HTTP.get_response(URI("#{@tags_uri}.json"))
  JSON.parse(response.body, symbolize_names: true)
end

def latest_tag_names
  latest_tags.map { |t| t[:name] }.compact
end

def tag_id_from_name(name, tags)
  tags.find { |t| t[:name] == name }.fetch(:id)
end

def latest_competencies
  response = Net::HTTP.get_response(URI("#{@competencies_uri}.json"))
  JSON.parse(response.body, symbolize_names: true)
end

def latest_competencies_names
  latest_competencies.map { |t| t[:name] }.compact
end

def competencies_id_from_name(name, competencies)
  comp = competencies.find { |t| t[:name] == name }
  comp[:id] if comp
end

def latest_topics
  response = Net::HTTP.get_response(URI("#{@topics_uri}.json"))
  JSON.parse(response.body, symbolize_names: true)
end

def latest_topics_names
  latest_competencies.map { |t| t[:name] }.compact
end

def topic_id_from_name(name, competencies)
  comp = competencies.find { |t| t[:name] == name }
  comp[:id] if comp
end

def post_competencies(comp, parent = nil)
  competencies = latest_competencies_names

  @json.fetch(:competencies, {}).each do |topic, comps|
    competency = comps.fetch(comp, '')
    next if competency.empty? || competencies.include?(competency)
    response = RestClient.post 'http://localhost:3000/competencies.json', competency: { name: competency }
    result = JSON.parse(response.body, symbolize_names: true)

    competencies << competency

    parent_comp = comps[parent] || 'ACM'
    parent_id = competencies_id_from_name(parent_comp, latest_competencies)
    response = RestClient.put "http://localhost:3000/competencies/#{parent_id}.json", competency: { competency: { id: result.fetch(:id) } }
  end
end

def post_topics(comp)
  topics = latest_topics_names
  @json.fetch(:competencies, {}).each do |topic, comps|
    topic = topic.to_s
    pp topic
    next if topic.empty? || topics.include?(topic)
    response = RestClient.post 'http://localhost:3000/topics.json', topic: { name: topic }
    result = JSON.parse(response.body, symbolize_names: true)
    topics << topic

    parent_comp = comps.fetch(comp)
    topic_id = topic_id_from_name(topic, latest_topics)
    parent_id = competencies_id_from_name(parent_comp, latest_competencies)
    response = RestClient.put "http://localhost:3000/competencies/#{parent_id}.json", competency: { competency: { id: topic_id } }
  end
end

root_competency = 'ACM'
RestClient.post 'http://localhost:3000/competencies.json', competency: { name: root_competency }

post_competencies(:area)
post_competencies(:subArea, :area)
post_topics(:subArea)
#
# post_topics
# put_sub_topics
#
#
pp latest_competencies.first(25)
#
#
# `HTTP POST http://localhost:3000/competencies.json competencies:='{"name": "ACM"}'`
#
# post_competency(:area)
#
# (2..latest_competencies.length - 1).each do |i|
#   pp `HTTP PUT http://localhost:3000/learnables/#{i}.json learnables:='{"competency": {"id": 1}}'`
# end
#
# post_competency(:subArea, :area)
#
# # (5..22).each do |i|
# #   pp `HTTP PUT http://localhost:3000/learnables/#{i}.json learnables:='{"competency": {"id": 4}}'`
# # end
# #
# # json.fetch(:competencies, {}).each do |topic, comps|
# #   competency = comps.fetch(:area, '').downcase
# #   next if competencies.include?(competency)
# #
# #   post_competency(competency)
# #   competencies << competency
# # end
# #
# # #
# # json.fetch(:competencies, {}).each do |topic, comps|
# #   tag = comps.fetch(:type, '').downcase
# #   next if tag.empty? || tags.include?(tag)
# #
# #   pp `HTTP POST #{@tags_uri}.json tag:='{"name": "#{tag}"}'`
# #
# #   tags << tag
# # end
# #
# # pp tags == latest_tag_names
