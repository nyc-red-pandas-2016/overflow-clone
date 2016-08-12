get '/tags/:id' do 
  @tag = Tag.find_by(id: params[:id])
  @questions = @tag.questions
  erb :'tags/show_by_tag'
end

post '/question_tags' do
  tag_name = params[:tag][:name].downcase
  tag_to_add = Tag.find_or_create_by(name: tag_name)
  existing_question_tag = QuestionTag.find_by(question_id: params[:question][:id], tag_id: tag_to_add.id)
  QuestionTag.find_or_create_by(question_id: params[:question][:id], tag_id: tag_to_add.id)
  if request.xhr?
    unless existing_question_tag
      "<li><a href='/tags/#{tag_to_add.id}'>" + tag_name + "</a></li>"
    else
      status 401
    end
  else
    redirect "/questions/#{params[:question][:id]}"
  end
end

put '/tags/search_by_name' do
  tag_to_find = Tag.find_by(name: params[:tag_name])
  if tag_to_find
    redirect "/tags/#{tag_to_find.id}"
  else
    @tag_name = params[:tag_name]
    erb :'tags/tag_not_found'
  end
end