require 'net/http'
require 'json'
require 'pp'

json = JSON.parse(File.read('sampledata.json'), symbolize_names: true)

uri = 'http://localhost:3000/'

json.fetch(:competencies, {}).each do |topic, comps|

end
