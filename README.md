Bookmark Manager
================

User Stories
------------

As a person who browses the internet
So that I can revisit sites that I like
I want to see a list of bookmarks that I have saved


Domain Model
------------

 GET /   ->   app.rb   ->  Bookmark
              app.rb   <-

         ->  bookmarks.erb  
         <-  HTML
-------------------------
Database Set Up
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

Test Database Set Up
5. Create the database using the psql command CREATE DATABASE bookmark_manager_test;
6. Connect to the database using the pqsl command \c bookmark_manager_test;
7. Run the query we have saved in the file 01_create_bookmarks_table.sql

Step 10 - decomposition of adding bookmarks into a user story

1. User enters the url of the bookmark
2. The url is captured.
3. The url stored in the database. 
