get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  erb :'/comments/new'
end

get '/questions/:id/answers/:answer_id/comments/new' do
  redirect '/' unless logged_in?
  @answer = Answer.find(params[:answer_id])
  erb :'/comments/new'
end

post '/comments' do

  redirect '/' unless logged_in?
  @comment = Comment.new(params[:comment])
  if @comment.save
    if request.xhr?
      #ajax
    else
      if params[:comment][:commentable_type] == "Answer
    "
        @question_id = Answer.find(params[:commentable_id]).question.id
        redirect "/questions/#{@question_id}"
      else
        redirect "/questions/#{@comment.commentable_id}"
      end
    end
  else
    @errors = @comment.errors.full_messages
    erb :'/comments/new'
  end
end
