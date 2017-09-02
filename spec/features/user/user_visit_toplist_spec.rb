require 'rails_helper'

feature 'user visit toplist' do
  before { create_list(:user, 15, :with_comments) }

  it 'returns only ten users' do
    visit '/toplist'
    expect(page).to have_selector('table tbody tr' , count: 10)
  end
end
