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
    erb :"index"
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/bookmarks' do
    url = params['url']
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
