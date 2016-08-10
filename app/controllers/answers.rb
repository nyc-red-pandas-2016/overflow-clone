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

