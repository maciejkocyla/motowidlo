require 'spec_helper'

describe "creating topic and post: " do
  subject { page }
  let(:category) { FactoryGirl.create(:category) }

  it "redirect to new topic path, " do 
    visit new_category_topic_path( category ) 
    expect(page).to have_content('utwórz temat: ') 
    expect(page).to have_content('pierwszy wpis') 
    
    it "create a topic" do 
      before do
        fill_in 'topic_name',     with: "sample topic"
        fill_in 'topic_heading',  with: "some basic heading"
      end
      expect {click('utwórz')}.to change(Topic, :count).by(1) 
    end
  end
end
