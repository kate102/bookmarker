require 'bookmark'

describe 'Bookmark' do

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")

    expect(Bookmark.all).to eq ['http://www.makersacademy.com','http://www.google.com', 'http://www.destroyallsoftware.com']
  end

  it 'it creates a new bookmark' do
    Bookmark.create(url: 'http://www.facebook.com')
    expect(Bookmark.all).to include 'http://www.facebook.com'
  end

end
