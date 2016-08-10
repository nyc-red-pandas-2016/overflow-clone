get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

get '/questions/new' do
  unless logged_in?
    redirect '/'
  else
    erb :'/questions/new'
  end
end

post '/questions' do
  unless logged_in?
    redirect '/'
  @question = Question.new(params[:question])
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
