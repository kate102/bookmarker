# This is a helper thingy
# it sets up the test environment correctly

require 'pg'
def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clear the bookmarks table
  connection.exec("TRUNCATE bookmarks;")
end

def populate_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clear the bookmarks table
  connection.exec("INSERT INTO bookmarks (url, title)
    VALUES('http://www.destroyallsoftware.com','Destroy All Software');")
  connection.exec("INSERT INTO bookmarks (url, title)
    VALUES('http://www.makersacademy.com','Makers Academy');")
  connection.exec("INSERT INTO bookmarks (url, title)
    VALUES('http://www.google.com','Google');")
end
