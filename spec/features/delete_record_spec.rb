require './app'
require 'database_helpers'

# require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

feature 'deleting a bookmark' do
  scenario 'deletes a bookmark' do

    Bookmark.add(url: 'http://www.facebook.com', title: 'Facebook')

    visit('/')
    expect(page).to have_content('Facebook')
    select('Facebook', :from => :title)
    click_button('Delete Bookmark')
    expect(page).not_to have_content('Facebook')
  end
end
