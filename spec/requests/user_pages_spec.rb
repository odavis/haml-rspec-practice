require 'spec_helper'

describe "User Pages" do
  subject { page }

  describe "signup page" do
    before {visit signup_path}
    it { should have_content('Sign up')}
    it { should have_title('Sign up')}
  end

  describe 'profile page' do
    let(:user) {FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe 'signup' do
    before { visit signup_path }

    describe 'with invalid information' do
      it 'should not create a user' do
        expect { click_button 'Create account' }.not_to change(User, :count)
      end
    end

    describe 'with valid information' do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: 'user@example.com'
        fill_in 'Password', with: 'password'
        fill_in "Confirmation", with: "password"
      end

      it 'should create user' do
        expect{ click_button 'Create account' }.to change(User, :count).by(1)
      end
    end
  end
end
