class CommentDecorator < Draper::Decorator
  delegate_all

  def user_name
    user = User.find_by(id: object.user_id)
    return user.name
  end

  def author?
    return true if h.current_user.id == object.user_id
  end
end
