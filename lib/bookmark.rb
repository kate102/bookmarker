require 'pg'

class Bookmark

  def all 
    con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    rs = con.exec "SELECT * FROM bookmarks"
    rs.map { |bookmark| bookmark['url'] }
  end

end
