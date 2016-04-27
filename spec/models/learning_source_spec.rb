require 'rails_helper'

RSpec.describe Competency, type: :model do
  describe '#create' do
    let(:learning_source) { FactoryGirl.create :learning_source }

  	it "creates a learning_source successfully" do
      expect(learning_source).to be_instance_of LearningSource
    end
    it "creates a learning_source with a competency successfully" do
      competency = FactoryGirl.create :competency, learning_sources: [learning_source]
      expect(learning_source.competency).to eq competency
    end
  end
end
