# This is a helper thingy
# it sets up the test environment correctly

require 'pg'
def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clear the bookmarks table
  connection.exec("TRUNCATE bookmarks;")
end
# setup_test_database
