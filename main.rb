require "sinatra"
require "slim"
require 'pry'

use Rack::Static, :urls => ['/uploads']

get '/' do
  slim :index
end

post '/process' do
  @image = FileProcessor.new(params[:file], params[:size], params[:color]).process

  @color = params[:color]
  slim :process
end

class FileProcessor
  require "mini_magick"

  def initialize(file, size, color)
    @file = file
    @size = size
    @color = color
    save_file
  end

  def save_file
    File.open('uploads/'+@file[:filename], 'w') do |file|
      file.write(@file[:tempfile].read)
    end
  end

  def process_file
    MiniMagick::Image.new('uploads/'+@file[:filename]) do |img|
      img.resize @size.to_s
    end
  end
end
