require 'rubygems'
require 'sinatra'

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000 #shotgun -o, --host 0.0.0.0
end
# please keep in mind that Sinatra apps in Nitrous.io need to be restarted every time a change is made to any code, sinatra uses port 4567
use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'flo_secret' 

set :session, true

get '/form' do
  erb :form
end

post '/myaction' do
  puts params['username']
end

get '/inline' do
  "Hi, directly from the action."
end

get '/template' do
  erb :mytemplate
end

get '/nested_template' do
  erb :"users/profile"
end

get '/nowhere' do
  redirect '/inline'
end



