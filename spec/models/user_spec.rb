require "rails_helper"

describe User do

  it { is_expected.to allow_value("+48 999 888 777").for(:phone_number) }
  it { is_expected.to allow_value("48 999-888-777").for(:phone_number) }
  it { is_expected.to allow_value("48 999-888-777").for(:phone_number) }
  it { is_expected.not_to allow_value("+48 aaa bbb ccc").for(:phone_number) }
  it { is_expected.not_to allow_value("aaa +48 aaa bbb ccc").for(:phone_number) }
  it { is_expected.not_to allow_value("+48 999 888 777\naseasd").for(:phone_number) }
  it { expect(User.toplisted.order_values).to eq ['comments_count DESC'] }
  it { expect(User.toplisted.limit_value).to eq 10 }
  it { expect(User.toplisted.joins_values).to eq [:comments] }
  it { expect(User.toplisted.group_values).to eq [:id] }
  it { expect(User.toplisted.select_values).to eq ['users.id, users.name, COUNT(comments.id) AS comments_count'] }
  it { is_expected.to have_many :comments }

  context 'users comments in toplist' do
    let(:user) { create(:user) }
    let(:movie) { create(:movie, 5)}

    it 'comment is too old' do
      days = (Time.zone.now - 8.days)
      FactoryGirl.create(:comment, user: user, created_at: days)
      expect(User.toplisted).to be_empty
    end

    it 'comment is too old' do
      days = ((Time.zone.now - 7.days) .. Time.zone.now)
      FactoryGirl.create(:comment, user: user, created_at: days)
      expect(User.toplisted).to_not be_empty
    end

    it 'one user has more comments' do
      user2 = FactoryGirl.create(:user)
      FactoryGirl.create(:comment, 2, user: user)
      FactoryGirl.create(:comment, 4, user: user2)
      binding.pry
      expect(User.toplisted.first).to eq user2.name
    end
  end
end
