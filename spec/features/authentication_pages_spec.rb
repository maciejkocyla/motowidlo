require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe "signin" do
    before { visit zaloguj_path }
    describe "with invalid information" do
      before { click_button "zaloguj" }
      it {should have_content( 'nieprawidłowe dane logowania') } 
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in 'session_email',    with: user.email.upcase
        fill_in 'session_password', with: user.password
        click_button "zaloguj"
      end

      it { should have_link('profil',      href: user_path(user)) }
      it { should have_link('wyloguj',     href: wyloguj_path) }
      it { should_not have_link('zaloguj', href: zaloguj_path) }

      describe "followed by signout" do 
        before { click_link 'wyloguj' }
        it { should have_link 'zaloguj' }
      end
    end
  end
end
