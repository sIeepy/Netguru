require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :movie_id }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:movie_id) }
  it { is_expected.to belong_to :user}
  it { is_expected.to belong_to :movie}

end
