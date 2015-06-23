require "sinatra"
require "slim"
require 'pry'

get '/' do
  slim :index
end

post '/process' do
  @image = FileProcessor.new(params[:file], params[:size], params[:color]).process
  slim :process
end

