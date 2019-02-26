require './app'
# require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

feature 'List bookmark list' do
  scenario ' displays bookmark list' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit '/bookmarks'
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end

  feature 'adding a bookmark' do
    scenario 'adds a bookmark' do
      visit('/bookmarks/new')
      fill_in('url', with: 'http://www.facebook.com')
      click_button('Submit')
      expect(page).to have_content('http://www.facebook.com')
    end
  end

end
