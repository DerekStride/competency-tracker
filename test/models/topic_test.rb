require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
    @competency = Competency.new(name: 'Ruby')
    @topic = Topic.new(name: 'Gems', competency: @competency)
    @topic.prerequisites << @topic
  end

  test 'it is a topic' do
    assert @topic.is_a?(Topic)
  end

  test "topic contains a reference to a competency" do
    assert_equal @competency, @topic.competency
  end

  test 'topics have prerequisites' do
    assert_equal [@topic], @topic.prerequisites
  end
end
