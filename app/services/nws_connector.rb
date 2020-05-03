class NwsConnector

  # TODO should have config file with endpoints
  # and different stations, etc

  # on each request, see if forecast needs update
  # and if so, get new forecast and cache

  # initialize per station or total? probably per station
  # so that each forecast only has its own info

  # that means app controller should initialize and make
  # available for the individual controllers?
  # possibly an object like
  # @forecasts = {
  #  "lincoln" => Forecaster Object
  # }

  attr_reader :stations

  def initialize
    # fire off initial request and fill out basic
    # information about this station / forecast
    @forecasts = {
      "lincoln" => {
        update: nil, forecast: nil
      }
    }
    @forecasts.default = { update: nil, forecast: nil }
  end

  def forecast(station)
    if should_update?(station)
      @forecasts[station] = {
        update: DateTime::now.in_time_zone('Central Time (US & Canada)'),
        forecast: update(station)
      }
    end
    @forecasts[station]
  end

  def req_forecast_daily(station)
    # TODO would actually send request to service
    file = File.join(File.dirname(__FILE__), "../../test/fixtures/files/day.json")
    JSON.parse(File.read(file))
  end

  def req_forecast_hourly(station)
    # TODO would actually send request to service
    file = File.join(File.dirname(__FILE__), "../../test/fixtures/files/hourly.json")
    JSON.parse(File.read(file))
  end

  def should_update?(station)
    # right now let's say yes
    # TODO
    true
  end

  def update(station)
    # send request for daily
    daily = req_forecast_daily(station)
    hourly = req_forecast_hourly(station)
    if daily && hourly
      Forecast.new(daily: daily, hourly: hourly)
    else
      puts "DID NOT FIND DAILY AND HOURLY"
      nil
    end
    # send request for hourly
    # return object
  end

end