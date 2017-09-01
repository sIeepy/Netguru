require 'rails_helper'

RSpec.describe CommentDecorator do
  let(:user) {create(:user)}
  let(:comment) {create(:comment, user: user)}

  describe '#user_name' do
    subject { comment.decorate.user_name }
    it { is_expected.to eq user.name }
  end
end
