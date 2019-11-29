# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.db
    dbname = 'bookmark_manager'
    dbname = 'bookmark_manager_test' if ENV['RACK_ENV'] == 'test'
    PG.connect(dbname: dbname)
  end

  def self.all
    bookmarks = []
    db.exec('SELECT * FROM bookmarks') do |result|
      result.each do |row|
        bookmarks << { name: row['name'], url: row['url'] }
      end
    end
    bookmarks
  end

  def self.create; end
end
