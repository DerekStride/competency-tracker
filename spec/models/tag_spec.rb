require 'rails_helper'

RSpec.describe Competency, type: :model do
  describe '#create' do
    let(:tag) { FactoryGirl.create :tag }

  	it "creates a tag successfully" do
      expect(tag).to be_instance_of Tag
    end
    it "creates a tag with a competency successfully" do
      competency = FactoryGirl.create :competency, tags: [tag]
      expect(tag.competencies).to eq [competency]
    end
  end
end
