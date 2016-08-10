get '/users/new' do
  erb :'users/register'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    # helper function to set cookie
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/register'
  end
end
