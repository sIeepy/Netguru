class UsersController < ApplicationController
  def toplist
    @top_users = User.toplisted
  end
end
