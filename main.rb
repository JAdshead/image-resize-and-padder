require "sinatra"
require "slim"
require 'pry'

get '/' do
  slim :index
end

post '/process' do
  @image = FileProcessor.new(params[:file], params[:width], params[:height], params[:color]).process
  @name = params[:file][:filename].scan(/\w+/).first
  binding.pry
  slim :process
end

