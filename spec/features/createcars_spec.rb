require 'rails_helper'

RSpec.feature "Createcars", type: :feature do
  context 'Create Crappy Car Page' do
      Steps 'Create Crappy Car' do
        Given 'Welcome to the Car Simulator' do
          visit '/cars/create'
        end
        When 'I fill in the car make and model year' do
          fill_in 'make', with: 'DeLorean'
          fill_in 'model', with: 'POS'
          fill_in 'year', with: '1985'
        end
        And 'I can submit the information' do
          click_button 'Similate Car'
        end
        Then 'I get redirected to the POSs status page' do
          visit '/cars/status'
        end
        Then 'Check for the PoS' do
          expect(page).to have_text('POS')
        end
        When 'I click on the accelerate button' do
          click_button('Accelerate')
        end
        Then 'The speed should be increased to 10' do
          expect(page).to have_content('Speed 10')
        end
        When 'I click on the brake button' do
          click_button('Brake')
        end
        Then "The speed should be decreased to 3" do
          expect(page).to have_content('Speed 3')
        end
        When 'I click on the brake again' do
          click_button('Brake')
        end
        Then 'The speed should be 0' do
          expect(page).to have_content('Speed 0')
        end
        When 'I toggle the lights switch' do
          click_button('Toggle Lights')
        end
        Then 'The lights should be on' do
          expect(page).to have_content('Lights are on')
        end
        When 'I toggle the lights switch again' do
          click_button('Toggle Lights')
        end
        Then 'The lights should be off' do
          expect(page).to have_content('Lights are off')
        end
        When 'I click on the Drift On! radio button' do
          page.choose("on")
          click_button('submit')
        end
        Then 'I should be on drift mode' do
          expect(page).to have_content('Drifting')
        end
      end
  end
end
