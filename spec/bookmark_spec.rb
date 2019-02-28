require 'bookmark'
require 'database_helpers'

describe 'Bookmark behaviour' do

  it 'returns a list of bookmarks' do
    # Add the test data
    Bookmark.create(url: 'http://www.makersacademy.com')
    mid_bookmark = Bookmark.create(url: 'http://www.google.com');
    Bookmark.create(url: 'http://www.destroyallsoftware.com');

    # Get the data back from the database
    bookmarks = Bookmark.all

    # Test it
    expect(bookmarks.length).to eq 3
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    expect(bookmarks.include?(mid_bookmark)) == true
    expect(bookmarks.last.url).to eq 'http://www.destroyallsoftware.com'
  end

  it 'it creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.facebook.com')

    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.url).to eq 'http://www.facebook.com'
  end

end
