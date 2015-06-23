class FileProcessor
  require "mini_magick"

  def initialize(file, width, height, color)
    @file = file
    @width = width
    @height = height
    @color = color
    save_file
  end

  def save_file
    File.open('uploads/'+@file[:filename], 'w') do |file|
      file.write(@file[:tempfile].read)
    end
  end

  def process
    MiniMagick::Image.new('uploads/'+@file[:filename]) do |img|
      img.resize "#{@width}x#{@height}"
    end
  end
end
