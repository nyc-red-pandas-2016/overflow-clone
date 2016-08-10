post '/votes/new' do
  vote = Vote.find_or_initialize_by(user_id: params[:vote][:user_id], votable_id: params[:vote][:votable_id], votable_type: params[:vote][:votable_type])
  vote.point_value = params[:vote][:point_value]
  vote.save
  redirect "/questions/#{params[:question_id]}"
end


