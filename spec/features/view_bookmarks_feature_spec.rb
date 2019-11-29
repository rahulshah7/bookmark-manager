# frozen_string_literal: true

require 'pg'

feature 'Bookmarks can be viewed' do
  before(:each) do
    setup_test_database
    dbname = 'bookmark_manager_test'
    conn = PG.connect(dbname: dbname)
    conn.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'https://www.google.com'), ('Bing', 'https://www.bing.com'), ('Facebook', 'https://www.facebook.com');")
  end
  scenario 'User visits /bookmarks to view bookmark list' do
    visit '/bookmarks'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Bing'
    expect(page).to have_content 'Facebook'
  end
end
