require "rails_helper"

RSpec.describe "the signin process", type: :system do
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
  
    it "signs me in" do
      Capybara.reset_sessions!
      visit '/'
      click_link('Prijavite se')
        fill_in :email, with: 'user@example.com'
        fill_in :password, with: 'password'
        fill_in :password_confirmation, with: 'password'
      click_button 'Prijavite se'
      expect(page).to have_link("Novi oglas za posao")
    end
end