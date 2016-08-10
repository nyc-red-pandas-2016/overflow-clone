get '/users/new' do
  erb :'users/register'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/register'
  end
end

get '/users/login' do
  erb :'users/login'
end

put '/users' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect '/'
  else
    @username = params[:username]
    @errors = ["Invalid username and password"]
    erb :'users/login'
  end
end
