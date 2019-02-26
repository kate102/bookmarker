require 'pg'

class Bookmark
  #
  def initialize(url ="/")
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end
    rs = con.exec "SELECT * FROM bookmarks"
    rs.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end
      con.exec"INSERT INTO bookmarks (url) VALUES('#{url}')"
  end


end
