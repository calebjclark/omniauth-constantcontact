require 'rubygems'

require 'bundler/setup'
require 'sinatra'
#require 'sinatra/base'
require '../lib/omniauth-constantcontact'

#class App < Sinatra::Base
  get '/' do
    redirect '/auth/constantcontact'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

#end

use Rack::Session::Cookie


use OmniAuth::Builder do
  provider :constantcontact,  ENV['CC_API_KEY'], ENV['CC_CONSUMER_SECRET']
end
