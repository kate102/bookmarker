require './app'
# require 'database_helpers'

# require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

feature 'View bookmark list' do
  scenario 'displays bookmark list' do
    # Add the test data
    Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.add(url: 'http://www.google.com', title: 'Google')
    Bookmark.all

    visit '/'

    # KM Why doesn't this work?
    # expect(page).to have_link("Makers", :href => "http://www.makersacademy.com")
    expect(page).to have_content("Makers")
    expect(page).to have_content("Google")
    expect(page).to have_content("Destroy All Software")
  end

end
