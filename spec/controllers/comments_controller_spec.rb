require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:movie) { build(:movie) }

  before do
    sign_in user
    @attrs = FactoryGirl.attributes_for(:comment, movie_id: :movie, user: user)
    @attrs_invalid = FactoryGirl.attributes_for(:comment_invalid, movie_id: :movie)
  end

  describe 'POST#create' do
    context 'with valid attributes' do
      it 'creates new comment' do
        expect {
          post :create, params: { movie_id: :movie, comment: @attrs }
        }.to change(Comment, :count).by(1)
      end

      it 'flashes info' do
        post :create, params: { movie_id: :movie, comment: @attrs }
        expect(flash[:notice]).to eq "Comment was succesfully created"
      end

      it 'redirects to the movie_path' do
        post :create, params: { movie_id: :movie, comment: @attrs }
        expect(response).to redirect_to movie_path(:movie)
      end
    end

    context 'with invalid attributes' do
      it 'does not create new micropost' do
        expect{
          post :create, params: { movie_id: :movie, comment: @attrs_invalid }
        }.to_not change(Comment, :count)
      end

      it 'flashes info' do
        post :create, params: { movie_id: :movie, comment: @attrs_invalid }
        expect(flash[:alert]).to eq "Comment was not created"
      end
    end
  end

  describe 'DELETE#destroy' do
    before do
      @comment_owner = FactoryGirl.create(:user)
      @not_comment_owner = FactoryGirl.create(:user)
      @comment = FactoryGirl.create(:comment, user: @comment_owner)
    end

    context 'user delete own comment' do
      it 'delete comment' do
        sign_in @comment_owner
        expect{
          delete :destroy, params: { movie_id: :movie, id: @comment.id }
        }.to change(Comment, :count).by(-1)
      end

      it 'flashes info' do
        sign_in @comment_owner
        delete :destroy, params: { movie_id: :movie, id: @comment.id }
        expect(flash[:notice]).to eq "Comment was destroy"
      end
    end

    context 'user delete not own comment' do
      it 'delete comment' do
        sign_in @not_comment_owner
        expect{
          delete :destroy, params: { movie_id: :movie, id: @comment.id }
        }.to_not change(Comment, :count)
      end

      it 'flashes info' do
        delete :destroy, params: { movie_id: :movie, id: @comment.id }
        expect(flash[:alert]).to eq "Comment was not destroy"
      end
    end
  end
end
