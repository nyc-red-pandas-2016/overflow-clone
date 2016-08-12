get '/questions/new' do
  redirect '/' unless logged_in?
    if request.xhr?
      erb :'/questions/new', layout: false
    else
      erb :'/questions/new'
    end
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
      erb :'/partials/_new_question', layout: false, locals: {question: @question}
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
  if request.xhr?
    erb :'/questions/edit', layout: false
  else
    erb :'/questions/edit'
  end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "/questions/#{@question.id}"
end
