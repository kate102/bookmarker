require './app'

feature 'Bookmarks home page' do
  scenario 'displays Bookmark Manager heading' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmark Manager')
  end
end
