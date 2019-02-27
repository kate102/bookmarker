require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions

  # What is the point of this?
  # Where does it go now?
  # Presumably we update this title page later?!?
  get '/' do
    'Bookmark Manager'
  end

  # This lists all of the bookmarks in the database
  # KM Why does the perfect soln go to 'bookmarks/index'?
  get '/bookmarks' do
    @bookmarks = Bookmark.all
<<<<<<< HEAD
    erb :"index"
=======
    # @x = bookmarks.all
    erb :index
>>>>>>> 320ff8c1f50cb84f9fae826fd31bdd8cc5dfe027
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
