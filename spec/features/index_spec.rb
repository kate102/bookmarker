require './app'

feature 'Bookmarks home page' do
  scenario 'displays Bookmark Manager heading' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmark Manager')
  end
end

feature 'List bookmark list' do
  scenario ' displays bookmark list' do
    visit '/bookmarks'
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end
