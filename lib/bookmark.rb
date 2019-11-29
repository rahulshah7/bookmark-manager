# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    # [
    #   { name: 'Google', url: 'https://www.google.com' },
    #   { name: 'Bing', url: 'https://www.bing.com' },
    #   { name: 'Facebook', url: 'https://www.facebook.com' }
    # ]
    bookmarks = []
    dbname = 'bookmark_manager'
    dbname = 'bookmark_manager_test' if ENV['RACK_ENV'] == 'test'
    conn = PG.connect(dbname: dbname)
    conn.exec('SELECT * FROM bookmarks') do |result|
      result.each do |row|
        bookmarks << { name: row['name'], url: row['url'] }
      end
    end
    bookmarks << { name: 'YouTube', url: 'https://www.youtube.com' }
    bookmarks
  end
end
