require 'rails_helper'

feature 'log in user' do
  let!(:movie) { create(:movie, :with_comments) }
  let(:user) {create(:user)}

  before { sign_in user }

  it 'can add comments' do
    visit_movie_page
    expect(page).to have_selector('form.new_comment')
  end

  it 'can create comment' do
    visit_movie_page
    create_comment
    expect(page).to have_selector('table tr', count: 6)
  end
  
  context 'can add only one comment' do
    before { create(:comment, user: user, movie: movie) }

    it 'can not add another comment' do
      visit_movie_page
      create_comment
      expect(page).to have_selector('table tr', count: 6)
    end

    it 'can create another comment when he delete previous' do
      visit_movie_page
      click_on(id: 'delete')
      expect(page).to have_selector('table tr', count: 5)
      create_comment
      expect(page).to have_selector('table tr', count: 6)
    end
  end

  it "can not create empty comment" do
    visit_movie_page
    click_button 'Create comment'
    expect(page).to have_selector('table tr', count: 5)
  end
end
