require 'sinatra'
get '/' do
  'Hello World'
end

get '/sinatra' do
  "<h1>Sinatra Rocks!</h1>"
end
