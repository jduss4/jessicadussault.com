class Location

  attr_reader :name
  attr_reader :gridpoint       # forecast
  attr_reader :weather_stn     # current observations
  attr_reader :zone            # alerts

  attr_reader :alerts
  attr_reader :current
  attr_reader :forecast

  def initialize(name, gridpoint, weather_stn, zone)
    @name = name
    @gridpoint = gridpoint
    @weather_stn = weather_stn
    @zone = zone

    @dir = get_file_dir
    create_nws_connections
  end

  def create_nws_connections
    @alerts = NwsConnection.new(
      File.join("alerts", "active", "zone", @zone),
      File.join(@dir, "alerts.json")
    )

    @current = NwsConnection.new(
      File.join("stations", @weather_stn, "observations", "latest"),
      File.join(@dir, "current.json")
    )

    # daily and hourly are handled differently, because they
    # are combined together as a "forecast" object
    daily = NwsConnection.new(
      File.join("gridpoints", @gridpoint, "forecast"),
      File.join(@dir, "daily.json")
    )

    hourly = NwsConnection.new(
      File.join("gridpoints", @gridpoint, "forecast", "hourly"),
      File.join(@dir, "hourly.json")
    )

    @forecast = Forecast.new(
      daily: daily,
      hourly: hourly
    )
  end

  def get_file_dir
    File.join(Rails.root, "tmp", "weather", @name.parameterize)
  end

end