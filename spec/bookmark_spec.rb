# frozen_string_literal: true

require 'pg'

describe Bookmark do
  before(:each) do
    setup_test_database
    dbname = 'bookmark_manager_test'
    conn = PG.connect(dbname: dbname)
    conn.exec("INSERT INTO bookmarks (name, url) VALUES ('Google', 'https://www.google.com'), ('Bing', 'https://www.bing.com'), ('Facebook', 'https://www.facebook.com');")
  end
  describe '.all' do
    it 'returns a list of bookmarks with a name' do
      expect(described_class.all.map { |el| el[:name] }).to start_with('Google', 'Bing', 'Facebook')
    end
    it 'returns a list of bookmarks with a url' do
      expect(described_class.all.map { |el| el[:url] }).to start_with('https://www.google.com', 'https://www.bing.com', 'https://www.facebook.com')
    end
  end
end
