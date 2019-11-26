# frozen_string_literal: true

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks with a name' do
      expect(described_class.all.map { |el| el[:name] }).to start_with('Google', 'Bing', 'Facebook')
    end
    it 'returns a list of bookmarks with a url' do
      expect(described_class.all.map { |el| el[:url] }).to start_with('https://www.google.com', 'https://www.bing.com', 'https://www.facebook.com')
    end
  end
end
