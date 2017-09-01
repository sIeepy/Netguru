require 'rails_helper'

feature 'unlogged user view' do
  let!(:movie) { create(:movie, :with_comments) }

  it 'can display comments under movie' do
    visit '/movies/' + movie.id.to_s
    expect(page).to have_selector('h3', text: 'Comments')
    expect(page).to have_selector('table tr', count: 5)
  end
end
