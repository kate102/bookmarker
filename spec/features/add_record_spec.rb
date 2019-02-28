require './app'
require 'database_helpers'

# require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

feature 'adding a bookmark' do
  scenario 'adds a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.facebook.com')
    fill_in('title', with: 'Facebook')
    click_button('Submit')
    expect(page).to have_content('http://www.facebook.com')
    expect(page).to have_content('Facebook')
  end
end
