get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  if request.xhr?
    erb :'/comments/edit', layout: false
  else
    erb :'/comments/edit'
  end
end

get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  if request.xhr?
    # binding.pry
    erb :'/comments/new', layout: false
  else
    erb :'/comments/new'
  end
end

get '/questions/:id/answers/:answer_id/comments/new' do
  redirect '/' unless logged_in?
  @answer = Answer.find(params[:answer_id])
  if request.xhr?
    erb :'/comments/new', layout: false
  else
    erb :'/comments/new'
  end
end

post '/comments' do
  redirect '/' unless logged_in?
  @comment = Comment.new(params[:comment])
  if @comment.save
    if request.xhr?
      if params[:comment][:commentable_type] == "Question"
        erb :'/partials/_new_comment', layout: false, locals: {comment: @comment, question: Question.find(@comment.commentable_id)}
      else
        answer = Answer.find(@comment.commentable_id)
        erb :'/partials/_new_comment', layout: false, locals: {comment: @comment, question: answer.question}
      end
    else
      if params[:comment][:commentable_type] == "Answer"
        @question_id = Answer.find(params[:comment][:commentable_id]).question.id
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

put '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.update(params[:comment])
    if @comment.commentable_type == "Question"
      redirect "/questions/#{@comment.commentable_id}"
    else @comment.commentable_type == "Answer"
      answer = Answer.find(@comment.commentable_id)
      redirect "/questions/#{answer.question_id}"
    end
end

delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  if @comment.commentable_type == "Question"
      redirect "/questions/#{@comment.commentable_id}" unless request.xhr?
  else @comment.commentable_type == "Answer"
      answer = Answer.find(@comment.commentable_id)
      redirect "/questions/#{answer.question_id}" unless request.xhr?
  end
end


