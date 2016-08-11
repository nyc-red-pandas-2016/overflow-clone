post '/questions/:id/answers' do
  @answer = Answer.new(params[:answer])
    redirect '/' unless logged_in?
    if @answer.save
      if request.xhr?
        erb :'/partials/_new_answer', layout: false, locals: {answer: @answer}
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
  redirect "/questions/#{@answer.question_id}" unless request.xhr?
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

put '/answer/:id/best' do
  answer = Answer.find(params[:id])
  previous_best = answer.question.answers.find_by(best_answer: true)
  previous_best.update(best_answer: false) if previous_best
  answer.update(best_answer: true)
  redirect "/questions/#{answer.question_id}"
end
