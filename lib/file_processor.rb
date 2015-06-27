class ImageProcessor
  require "mini_magick"

  def initialize(img, width, height, color)
    @img = img
    @width = width
    @height = height
    @color = color || "transparent"
  end

  def process
    # if @color == "transparent"
    #   img = MiniMagick::Image.new(@img.path)
    #   img.format "png"
    # end

    MiniMagick::Image.new(@img.path) do |img|
      img.resize "#{@width}x#{@height}"
      img.background "#{@color}"
      img.gravity "center"
      img.extent "#{@width}x#{@height}"
    end
  end

end
