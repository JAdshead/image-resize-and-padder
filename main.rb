require "sinatra"
require "slim"
require 'pry'

get '/' do
  slim :index
end

post '/process' do
  @image = Image.new(params[:file])
  binding.pry
  ImageProcessor.new(@image , params[:width], params[:height], params[:color]).process
  slim :process
end

