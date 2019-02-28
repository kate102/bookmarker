require 'pg'

class Bookmark

  attr_reader :id, :url

  def initialize(id:, url:)
    @id = id
    @url = url
  end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else
      PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end

  end

  def self.all
    con = connect_to_database
    rs = con.exec "SELECT * FROM bookmarks"
    rs.map do |bookmark|
      Bookmark.new(id: bookmark['id'], url: bookmark['url'])
    end
  end

  def self.create(url:)
    con = connect_to_database
    result = con.exec("INSERT INTO bookmarks (url)
      VALUES('#{url}') RETURNING id, url;")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'])
  end



end
