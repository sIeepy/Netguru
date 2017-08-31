class Comment < ApplicationRecord
  validates_presence_of :movie_id, :user_id, :text
  validates_uniqueness_of :user_id, scope: :movie_id

  belongs_to :user
  belongs_to :movie
end
