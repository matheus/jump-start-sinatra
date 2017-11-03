require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?

get '/hello' do
  name = 'Frank'
  "Hello #{name} "
end

get '/hello/:name' do
  name = params[:name]
  "Hello #{name}"
end

get '/ages' do
  ages = {bart: 10, lisa: 8, maggie: 1}
  "Ages: Bart #{ages[:bart]}, Lisa #{ages[:lisa]} and Maggie #{ages[:maggie]}"
end

get '/:one/:two/:three' do
  "first #{params[:one]}, second: #{params[:two]}, third: #{params[:three]}"
end

get '/what/time/is/it/in/:number/hours' do
  number = params[:number].to_i
  time = Time.now + number * 3600
  "The time in #{number} hours will be #{time.strftime('%I:%M %p')}"
end
