require './app'
require 'database_helpers'

# require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

feature 'adding a bookmark' do
  scenario 'adds a bookmark' do
    visit('/')
    fill_in 'url', with: 'https://www.facebook.com'
    fill_in 'title', with: 'Facebook'
    click_button 'Add Bookmark'
    # KM why doesn't this work?
    # expect(page).to have_link("Facebook", :href => "https://www.facebook.com")
    expect(page).to have_content('Facebook')
  end
end
