require 'rails_helper'

RSpec.describe Competency, type: :model do
  describe '#create' do
  	it "creates a competency successfully" do
      comp = FactoryGirl.create :competency
      expect(comp).to be_instance_of Competency
    end
    it "creates a competency with prerequisites successfully" do
      comp = FactoryGirl.create :competency_with_prerequisites
      expect(comp).to be_instance_of Competency
      # expect(comp.prerequisites).to match_array()
    end
  end
end
