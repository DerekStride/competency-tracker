require 'rails_helper'

RSpec.describe Competency, type: :model do
  describe '#create' do
    let(:competency) { FactoryGirl.create :competency }

  	it "creates a competency successfully" do
      expect(competency).to be_instance_of Competency
    end
    it "creates a competency with prerequisites successfully" do
      competency_with_prerequisites = FactoryGirl.create :competency, prerequisites: [competency]
      expect(competency_with_prerequisites.prerequisites).to eq [competency]
      expect(competency.postrequisites).to eq [competency_with_prerequisites]
    end
    it 'creates a competency with a tag' do
      tag = FactoryGirl.create :tag
      competency.tags << tag
      expect(competency.tags).to eq [tag]
    end
  end
end
