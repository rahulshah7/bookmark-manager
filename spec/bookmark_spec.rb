# frozen_string_literal: true

require 'pg'

describe Bookmark do
  before(:each) do
    setup_test_database
    dbname = 'bookmark_manager_test'
    conn = PG.connect(dbname: dbname)
    conn.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'https://www.google.com'), ('Bing', 'https://www.bing.com'), ('Facebook', 'https://www.facebook.com');")
  end
  describe '.all' do
    it 'returns a list of bookmarks with a title' do
      expect(described_class.all.map(&:title)).to start_with('Google', 'Bing', 'Facebook')
    end
    it 'returns a list of bookmarks with a url' do
      expect(described_class.all.map(&:url)).to start_with('https://www.google.com', 'https://www.bing.com', 'https://www.facebook.com')
    end
  end

  describe '.create' do
    it 'adds to the list of bookmark titles' do
      described_class.create('YouTube', 'https://www.youtube.com')
      expect(described_class.all.map(&:title))
        .to start_with('Google', 'Bing', 'Facebook', 'YouTube')
    end
    it 'adds to the list of bookmark urls' do
      described_class.create('YouTube', 'https://www.youtube.com')
      expect(described_class.all.map(&:url))
        .to start_with('https://www.google.com', 'https://www.bing.com', 'https://www.facebook.com', 'https://www.youtube.com')
    end
  end
end
