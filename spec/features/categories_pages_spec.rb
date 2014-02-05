require 'spec_helper'

describe "categories pages" do
  subject { page }

  describe "categories index" do 
    before { visit root_path }
    it {should have_link('nowa kategoria')}
  end

  describe "while creating new category" do
    before { visit new_category_path }
    it {should have_content('Nazwa nowej kategorii: ')}
    let(:submit) {"utwórz"}

    describe "with apropriate name" do
      before do
        fill_in 'category_name',    with: "Sample Category"
      end

      it "should create a category" do
        expect { click_button submit }.to change(Category, :count).by(1)
      end
    end

    describe "with empty field" do
      it "should not create category" do
        expect {click_button submit }.not_to change(Category, :count).by(1)
      end
    end
  end
end
