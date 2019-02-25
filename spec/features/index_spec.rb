require './app'

feature 'displays Hello World' do
  scenario 'displays Hello World under extreme torture' do
    visit '/'
    expect(page).to have_content('Hello World')
  end
end
