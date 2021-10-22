# frozen_string_literal: true

require 'json'
require 'net/http'
require 'slim'
require 'sinatra'
require 'sinatra/reloader' if development?

URL_API = 'devlib.herokuapp.com'

get '/' do
  slim :index
end

post '/' do
  json = Net::HTTP.get(URL_API, "/#{params[:id]}")
  @book = JSON.parse(json)
  slim :index
end
