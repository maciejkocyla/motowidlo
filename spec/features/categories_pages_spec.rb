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
      
      describe " and creating subcategory " do
        before do
          @cat = Category.create(name: "sample category")
          visit category_path(@cat)
          click_link('dodaj podkategorię') 
        end
        it { should have_content('Nazwa nowej kategorii: ') }

        describe "with apropriate name" do
          before do 
            fill_in 'category_name',  with: "sample Subcategory"
          end
          it "should create subcategory" do
            expect {click_button submit}.to change(Category.last.subcategories, :count).by(1)
          end
        end
      end
    end

    describe "with empty field" do
      it "should not create category" do
        expect {click_button submit }.not_to change(Category, :count).by(1)
      end
    end
  end
end
