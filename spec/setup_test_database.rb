# frozen_string_literal: true

require 'pg'

def setup_test_database
  dbname = 'bookmark_manager_test'
  conn = PG.connect(dbname: dbname)
  conn.exec('DROP TABLE IF EXISTS bookmarks;')
  conn.exec('CREATE TABLE bookmarks (name varchar(60) NOT NULL, url varchar(60) NOT NULL);')
  conn.close
end
