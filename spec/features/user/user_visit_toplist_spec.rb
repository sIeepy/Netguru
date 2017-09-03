require 'rails_helper'

feature 'user visit toplist' do
  before do
    15.times { create(:user_with_comments, comments_count: rand(1..15)) }
  end

  it 'returns only ten users' do
    visit '/toplist'
    save_and_open_page
    expect(page).to have_selector('table tbody tr' , count: 10)
  end
end
