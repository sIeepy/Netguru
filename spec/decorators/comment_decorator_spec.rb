require 'rails_helper'

RSpec.describe CommentDecorator do
  let(:user) { create(:user) }
  let(:comment) { create(:comment, user: user, created_at: Time.zone.now) }

  before { allow(helper).to receive(:current_user) { user } }

  describe '#user_name' do
    subject { comment.decorate.user_name }
    it { is_expected.to eq user.name }
  end

  describe '#author?' do
    subject { comment.decorate.author? }
    it { is_expected.to eq true }
  end

  describe '#creation_date' do
    subject { comment.decorate.creation_date }
    it { is_expected.to eq Time.zone.now.strftime('%d-%m-%Y %H:%M') }
  end
end
