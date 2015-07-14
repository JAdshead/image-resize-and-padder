class ImageProcessor
  require "mini_magick"

  def initialize(img, width, height, color)
    @img = img
    @iMagick = MiniMagick::Image.new(@img.path)
    @width = clean(width)
    @height = clean(height)
    @color = clean(color) || "transparent"
  end

  def process
    if @color == "transparent"
      @iMagick.format "png"
    end

    @iMagick.combine_options do |c|
     c.resize "#{@width}x#{@height}"
     c.background "#{@color}"
     c.gravity "center"
     c.extent "#{@width}x#{@height}"
    end

  end

  def clean string
    string.strip.downcase.scan(/\#?\w+/).first
  end
end
