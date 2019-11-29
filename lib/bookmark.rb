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
        bookmarks << { id: row['id'], title: row['title'], url: row['url'] }
      end
    end
    bookmarks
  end

  def self.create(title, url)
    db.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');")
  end
end
