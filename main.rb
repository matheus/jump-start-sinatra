require 'sinatra'
require 'slim'
require 'sass'

get('/styles.css'){ scss :styles}

set :public_folder, 'public'
# set :views, 'templates'

get '/' do slim :home end

get '/about' do slim :about end

get '/contact' do slim :contact end

not_found do slim :not_found end
