require "open-uri"

class NwsConnection

  @@update_interval = 1.hour

  attr_reader :update

  def initialize(url, file_location)
    @url = File.join("https://api.weather.gov/", url)
    @file_location = file_location
    create_dir

    get_json
  end

  def ask_nws
    puts "sending request to #{@url}"
    @update = Time.now
    res = URI.open(@url).read
    json = JSON.parse(res)
    json_write(json)
    json
  end

  def create_dir
    dir = File.dirname(@file_location)
    FileUtils.mkdir_p(dir)
  end

  def get_json
    if @json && @update
      if up_to_date?(@update)
        return @json
      end
    else
      # assume the app has been restarted and we should check the file system
      if up_to_date?(last_file_modification)
        return json_read
      end
    end
    # if there isn't already up to date json in memory or on the file system
    # then make a request to NWS
    ask_nws
  end

  def last_file_modification
    if File.file?(@file_location)
      File.mtime(@file_location)
    end
  end

  def json_read
    if File.file?(@file_location)
      JSON.parse(File.read(@file_location))
    end
  end

  def json_write(data)
    File.open(@file_location, "w") { |f| f.write(JSON.pretty_generate(data)) }
  end

  def up_to_date?(time)
    if time
      compare_time = Time.now - @@update_interval
      # returns true if the last update was longer ago than
      # the threshold for updating
      time >= compare_time
    else
      false
    end
  end

end