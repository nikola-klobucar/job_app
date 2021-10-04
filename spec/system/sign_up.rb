require "rails_helper"

RSpec.describe "the signup process", type: :system do
    before do
        driven_by(:selenium_chrome_headless)
      end
  
    it "signs me up" do
      Capybara.reset_sessions!
      visit '/'
      click_link('Registrirajte se')
      fill_in 'Ime', with: 'Foo'
      fill_in 'Prezime', with: 'Bar'
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Zaporka', with: 'password'
        fill_in 'Potvrdite zaporuku', with: 'password'
      click_button 'Stvori User'
      expect(page).to have_link("Novi oglas za posao")
      expect(page).to have_link("Odjavite se")
    end
end