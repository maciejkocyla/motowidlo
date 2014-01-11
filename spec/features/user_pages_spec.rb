require 'spec_helper'
describe "user pages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }

    before { visit user_path( user) }
    it { should have_content(user.name) }
  end

  describe "signup page" do
    before { visit new_user_path }

    it { should have_content('Nowy użytkownik: ') }

    let(:submit) { "Utwórz konto" }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid info" do
      before do
        fill_in "Nazwa",            with: "Example User"
        fill_in "Email",            with: "user@example.com"
        fill_in "Hasło",            with: "foobar"
        fill_in "Potwierdź hasło",  with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end
