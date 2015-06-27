class Image
  attr_accessor :path, :shortname, :longname

  def initialize(file)
    @longname = file[:filename]
    @shortname = file[:filename].scan(/\w+/).first
    @path = 'uploads/'+ file[:filename]
    save_file(file[:tempfile].read)
  end

  def save_file(tempfile)
    File.open(@path, 'w') do |file|
      file.write(tempfile)
    end
  end
end
