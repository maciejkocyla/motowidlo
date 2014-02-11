require 'spec_helper'

describe Category do 
  before { @cat = Category.new(name: "sample category") }
  subject { @cat }

  it { should respond_to(:name) }
  it { should respond_to(:subcategories) }
  it { should respond_to(:overcategory) }
  it { should respond_to(:topics) }
  it { should be_valid }
  
  describe "when name is not present" do
    before { @cat.name = "" }
    it { should_not be_valid }
  end

end
