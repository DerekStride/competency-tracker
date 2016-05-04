require 'rails_helper'

RSpec.describe Competency, type: :model do
  describe '#create' do
    let(:competency) { build(:competency) }

  	it 'creates a competency successfully' do
      expect(competency).to be_instance_of Competency
    end
  end

  describe '#prerequisites' do
    let(:competency) { build(:competency) }
    let(:competency_with_prerequisites) { build(:competency, prerequisites: [competency]) }

    it 'should list the prerequisites of the competency' do
      expect(competency_with_prerequisites.prerequisites).to eq [competency]
    end
  end

  describe '#postrequisites' do
    let(:competency) { build(:competency) }
    let(:competency_with_postrequisites) { build(:competency, postrequisites: [competency]) }

    it 'should list the postrequisites of the competency' do
      expect(competency_with_postrequisites.postrequisites).to eq [competency]
    end
  end

  describe '#tags' do
    let(:tag) { build(:tag) }
    let(:competency_with_tags) { build(:competency, tags: [tag]) }

    it 'should list the tags of the competency' do
      expect(competency_with_tags.tags).to eq [tag]
    end
  end

  describe '#name' do
    let(:competency) { build(:competency, name: 'Nginx') }
    it 'returns the name of the competency' do
      expect(competency.name).to eq 'Nginx'
    end
  end

  describe '#proficiency' do
    let(:competency) { build(:competency, proficiency: 'Beginner') }
    it 'returns the Beginner of the competency' do
      expect(competency.proficiency).to eq 'Beginner'
    end
  end
end
