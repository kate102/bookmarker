require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  # enable :sessions

  # What is the point of this?
  # Where does it go now?
  # Presumably we update this title page later?!?

  # This lists all of the bookmarks in the database
  # KM Why does the perfect soln go to 'bookmarks/index'?
  get '/' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/' do
    @bookmarks = Bookmark.all
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  post '/delete' do
    Bookmark.delete(title: params[:title])
    redirect '/'
  end

  run! if app_file == $0
end
