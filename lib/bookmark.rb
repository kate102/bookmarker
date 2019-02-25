require 'pg'

class Bookmark

  def all
    begin

    con = PG.connect :dbname => 'bookmark_manager', :user => 'student'

    rs = con.exec "SELECT * FROM bookmarks"

    urls=[]
    rs.each do |row|
      urls.push(row['url'])
    end
    return urls

    rescue PG::Error => e

      puts e.message

    ensure

    #  rs.clear if rs
      con.close if con

    end

  end

end
