require "rails_helper"

RSpec.describe "the logout process", type: :system do
    before do
        driven_by(:selenium_chrome_headless)
      end
      
    before :each do
      @user = User.create(
          first_name: "Nikola",
          last_name: "Klobučar",
          email: 'user@example.com', 
          password: 'password',
          password_confirmation: "password"
      )
    end
  
    it "signs me in and then logout" do
      Capybara.reset_sessions!
      visit '/'
      click_link('Prijavite se')
        fill_in :email, with: 'user@example.com'
        fill_in :password, with: 'password'
        fill_in :password_confirmation, with: 'password'
      click_button 'Prijavite se'
      click_link('Odjavite se')
      expect(page).to have_link("Prijavite se")
      expect(page).to have_link("Registrirajte se")
    end
end