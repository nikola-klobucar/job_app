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
  
    it "creates an ad" do
      Capybara.reset_sessions!
      visit '/'
      click_link('Prijavite se')
        fill_in :email, with: 'user@example.com'
        fill_in :password, with: 'password'
        fill_in :password_confirmation, with: 'password'
      click_button 'Prijavite se'
      expect(page).to have_link("Novi oglas za posao")
      click_link("Novi oglas za posao")
      fill_in 'Naziv posla', with: 'Fizičar'
      fill_in 'Opis', with: 'Dodaj opis'
      fill_in 'Ime poslodavca', with: 'Nikola Klobučar'
      fill_in 'Email poslodavca', with: 'foo@bar.com'
      select 'Prirodne znanosti', from: 'Kategorija'
      select '15', :from => 'Oglas vrijedi do:'
      page.execute_script('window.scrollTo(0, document.body.scrollHeight)')
      click_button 'Stvori Ad'
      expect(page).to have_link("Ažurirajte oglas")
      expect(page).to have_link("Izbrišite oglas")
    end
end