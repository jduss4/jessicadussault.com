require "fileutils"

class Weather

  attr_reader :stations

  def initialize
    @stations = [
      Location.new("lincoln", "OAX/53,40", "KLNK", "NEZ066")
    ]
  end

  def status(station)
    @stations.find { |s| s.name == station }
  end

end