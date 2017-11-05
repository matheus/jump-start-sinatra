require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require 'sass'
require './song'

configure do
  enable :sessions
  set :username, 'frank'
  set :password, 'sinatra'
end

get '/login' do
    slim :login
end

post '/login' do
  if params[:username] == settings.username && params[:password] == settings.password
    session[:admin] = true
    redirect to ('/songs')
  else
    slim :login
  end
end

get '/set/:name' do
  session[:name] = params[:name]
end

get '/get/hello' do
  "Hello #{session[:name]}"
end

get('/styles.css'){ scss :styles}

set :public_folder, 'public'
# set :views, 'templates'

get '/' do slim :home end

get '/about' do slim :about end

get '/contact' do slim :contact end

not_found do slim :not_found end
