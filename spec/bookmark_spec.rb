require 'bookmark'

describe 'Bookmark' do
  it 'returns a list of bookmarks' do
    b = Bookmark.new
    expect(b.all).to eq ['x', 'y', 'z']
  end
end
