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

    describe "authorization" do
      describe "for non signed in users" do
        let(:user) {FactoryGirl.create(:user)}
        
        describe "as wrong user" do
          let(:user) { FactoryGirl.create(:user) }
          let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
          before { sign_in user, no_capybara: true }

          describe "submitting a GET request to the Users#edit action" do
            before { get edit_user_path(wrong_user) }
            specify { expect(response.body).not_to match(full_title('Edit user')) }
            specify { expect(response).to redirect_to(root_url) }
          end

          describe "submitting a PATCH request to the Users#update action" do
            before { patch user_path(wrong_user) }
            specify { expect(response).to redirect_to(root_url) }
          end
        end

        describe "in users_controller" do
          
          describe "visiting edit page" do
            before {visit edit_user_path(user)}
            it { should have_content("zaloguj się") } 
          end

          describe "submitting to the update action" do
            before {patch user_path(user)}
            specify { expect(response).to redirect_to(zaloguj_path)}
          end
        end
      end

    end
  end
end
