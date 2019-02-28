require 'pg'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
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
      Bookmark.new(id: bookmark['id'], url: bookmark['url'],
        title: bookmark['title'])
    end
  end

  def self.create(url:, title:)
    con = connect_to_database
    result = con.exec("INSERT INTO bookmarks (url, title)
      VALUES('#{url}', '#{title}') RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'],
      title: result[0]['title'])
  end


    def self.delete(title:)
      con = connect_to_database
      result = con.exec("DELETE FROM bookmarks WHERE title = '#{title}';")
    end

end
