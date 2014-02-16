require 'spec_helper'

describe Topic do
  before { @topic = Topic.new(name: "sample topic", heading: "sample heading") }
  subject { @topic }

  it { should respond_to(:heading) }
  it { should respond_to(:name) }
  it { should respond_to(:category) }
  it { should be_valid }

  describe "when name is not present" do
    before { @topic.name = "" }
    it { should_not be_valid }
  end

end
