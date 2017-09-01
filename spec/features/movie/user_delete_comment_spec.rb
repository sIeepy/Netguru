require 'rails_helper'

feature 'User delete comment' do
  let!(:movie) { create(:movie, :with_comments) }
  let(:user) {create(:user)}

  before { sign_in user }

  it 'can delete own comment' do
    create(:comment, user: user, movie: movie)
    visit_movie_page
    expect(page).to have_selector('table tr', count: 6)
    click_link 'Delete'
    expect(page).to have_selector('table tr', count: 5)
  end

  it 'not allows user to delete not own comment' do
    user_2 = FactoryGirl.create(:user)
    visit_movie_page
    create(:comment, user: user_2, movie: movie)
    expect(page).to_not have_selector('Delete')
  end
end
