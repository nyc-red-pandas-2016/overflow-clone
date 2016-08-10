helpers do

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    current_user
  end

  def current_username
    current_user.username if logged_in?
  end

  def voted?
    Question.first.votes.find_by(@current_user.id).point_value
  end


end
