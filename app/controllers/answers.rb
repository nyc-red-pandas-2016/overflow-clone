post '/questions/:id/answers' do
  @answer = Answer.new(params[:answer])
    redirect '/' unless logged_in?
    if @answer.save
      if request.xhr?
        #ajax
      else
        redirect "/questions/#{@answer.question_id}"
      end
    else
      @errors = @answer.errors.full_messages
      erb :'/questions/show'
    end
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/questions/#{@answer.question_id}"
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'/answers/edit'
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.update(params[:answer])
  redirect "/questions/#{@answer.question_id}"
end
