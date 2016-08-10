get '/questions/new' do
  unless logged_in?
    redirect '/'
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
  unless logged_in?
    redirect '/'
  else
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
end
