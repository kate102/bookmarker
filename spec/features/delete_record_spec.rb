require './app'
require 'database_helpers'

# require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

feature 'deleting a bookmark' do
  scenario 'deletes a bookmark' do

    # visit('/add')
    # fill_in('url', with: 'http://www.facebook.com')
    # fill_in('title', with: 'Facebook')
    # click_button('Submit')
    Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')

    visit('/display')
    # expect(page).to have_content('http://www.facebook.com')
    #
    # visit('/')
    # select('Facebook',:from => :title )
    # click_button('Delete')
    #
    # # expect(page).not_to have_content('http://www.facebook.com')
    # # visit('/display')
    # expect(page).not_to have_content('Facebook')
  end
end
