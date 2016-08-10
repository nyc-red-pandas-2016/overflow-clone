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
