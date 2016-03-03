require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
    @competency = competencies(:ruby)
    @topic = topics(:gems)
  end

  test 'it is a topic' do
    assert @topic.is_a?(Topic)
  end

  test "topic contains a reference to a competency" do
    assert_equal @competency, @topic.competency
  end
end
