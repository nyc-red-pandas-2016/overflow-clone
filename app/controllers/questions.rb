get '/questions/new' do
  redirect '/' unless logged_in?
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  @question = Question.new(params[:question])
  redirect '/' unless logged_in?
  if @question.save
    if request.xhr?
      #ajax
    else
      redirect '/'
    end
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'/questions/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "/questions/#{@question.id}"
end
