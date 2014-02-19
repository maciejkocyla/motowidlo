require 'spec_helper'

describe "creating topic and post: " do
  subject { page }
  let(:category) { FactoryGirl.create(:category) }
  before do
    visit new_category_topic_path( category ) 
  end

  it "redirect to new topic path, " do 
    expect(page).to have_content('utwórz temat: ') 
    expect(page).to have_content('pierwszy wpis: ') 
  end    
  describe "create a topic" do 
    before do
      fill_in 'topic_name',     with: "sample topic"
      fill_in 'topic_heading',  with: "some basic heading"
    end
    it "should create topic" do 
      expect { click_button('utwórz')}.to change(Topic, :count).by(1) 
    end

    describe " and to create a post " do
      before { click_button('utwórz') }

      it { should have_content('sample topic') }
      it { should have_content('twoja odpowiedź') }
      it { should have_button("dodaj odpowiedź") }
    end
  end
end
