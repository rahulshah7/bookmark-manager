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
    conn = PG.connect(dbname: 'bookmark_manager')
    conn.exec('SELECT * FROM bookmarks') do |result|
      result.each do |row|
        bookmarks << { name: row['name'], url: row['url'] }
      end
    end
    bookmarks
  end
end
