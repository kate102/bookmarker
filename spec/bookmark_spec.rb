require 'bookmark'

describe 'Bookmark' do
  it 'returns a list of bookmarks' do
    b = Bookmark.new
    expect(b.all).to eq ['http://www.makersacademy.com',
      'http://www.google.com', 'http://www.destroyallsoftware.com']
  end
end
