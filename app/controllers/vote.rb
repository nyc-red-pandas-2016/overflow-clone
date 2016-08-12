post '/votes/new' do
  if current_user
    vote = Vote.find_or_initialize_by(user_id: params[:vote][:user_id], votable_id: params[:vote][:votable_id], votable_type: params[:vote][:votable_type])
    vote.point_value = params[:vote][:point_value]
    vote.save
    if params[:vote][:votable_type] == "Question"
      question = Question.find(params[:question_id])
    elsif params[:vote][:votable_type] == "Answer"
     answer = Answer.find(params[:vote][:votable_id])
    else params[:vote][:votable_type] == "Comment"
      comment = Comment.find(params[:vote][:votable_id])
    end
  end
  if request.xhr?
    if params[:vote][:votable_type] == "Question"
      question.votes.pluck("point_value").sum.to_s
    elsif params[:vote][:votable_type] == "Answer"
      answer.votes.pluck("point_value").sum.to_s
    elsif params[:vote][:votable_type] == "Comment"
      comment.votes.pluck("point_value").sum.to_s
    end
  else
    redirect "/questions/#{params[:question_id]}"
  end
end


