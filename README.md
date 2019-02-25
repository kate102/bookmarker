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
