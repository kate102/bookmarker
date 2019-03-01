require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/add' do
    @bookmarks = Bookmark.all
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/'
  end

  post '/delete' do
    Bookmark.delete(title: params[:title])
    redirect '/'
  end

  run! if app_file == $0
end
