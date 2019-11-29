# frozen_string_literal: true

require 'pg'

feature 'New Bookmark can be created' do
  before(:each) do
    setup_test_database
    dbname = 'bookmark_manager_test'
    conn = PG.connect(dbname: dbname)
    conn.exec("INSERT INTO bookmarks (name, url) VALUES ('Google', 'https://www.google.com'), ('Bing', 'https://www.bing.com'), ('Facebook', 'https://www.facebook.com');")
  end

  scenario 'User visits /bookmarks/new to create a bookmark' do
    visit '/bookmarks/new'

    within('#create_bookmark') do
      fill_in 'Name', with: 'YouTube'
      fill_in 'URL', with: 'https://www.youtube.com'
      click_button 'Create'
    end

    # User redirected to /bookmarks
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Bing'
    expect(page).to have_content 'Facebook'
    expect(page).to have_content 'YouTube'
  end
end
