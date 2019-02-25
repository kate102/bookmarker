require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    bookmarks = Bookmark.new
    @x = bookmarks.all
    erb :index
  end

  run! if app_file == $0
end
