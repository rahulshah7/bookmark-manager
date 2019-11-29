# frozen_string_literal: true

require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def self.db
    dbname = 'bookmark_manager'
    dbname = 'bookmark_manager_test' if ENV['RACK_ENV'] == 'test'
    PG.connect(dbname: dbname)
  end

  def self.all
    bookmarks = []
    db.exec('SELECT * FROM bookmarks') do |result|
      result.each do |row|
        bookmarks << new(row['id'], row['title'], row['url'])
      end
    end
    bookmarks
  end

  def self.create(title, url)
    db.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');")
  end

  private

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end
end
