require './app'
# require 'database_helpers'

# require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

feature 'View bookmark list' do
  scenario 'displays bookmark list' do
    # Add the test data
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')

    visit '/'

    expect(page).to have_link("Makers", :href => "http://www.makersacademy.com")
    expect(page).to have_link("Google", :href => "http://www.google.com")
    expect(page).to have_link("Destroy All Software", :href => "http://www.destroyallsoftware.com")
  end

end
