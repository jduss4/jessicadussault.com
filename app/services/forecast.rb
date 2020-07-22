class Forecast

  attr_reader :periods

  def initialize(daily: nil, hourly: nil)
    @periods = []
    combine_forecasts(daily, hourly)
  end

  def calc_range(period)
    # get the high and low of the time period
    temps = period["hours"].map { |p| p["temperature"].to_i }
    {
      "low" => temps.min,
      "high" => temps.max
    }
  end

  def combine_forecasts(daily, hourly)
    hourly_periods = hourly.get_json["properties"]["periods"]

    daily.get_json["properties"]["periods"].each do |period|
      start = period["startTime"]
      finish = period["endTime"]
      period["hours"] = hourly_periods.select { |hour| contains_hour?(start, finish, hour["startTime"]) }
      puts "hours by day: #{start} -> #{period["hours"]}"
      # calculate the high and low temperatures for the period
      period["range"] = calc_range(period)

      @periods << period
    end

  end

  def contains_hour?(startTime, endTime, hour)
    start = DateTime.parse(startTime)
    finish = DateTime.parse(endTime)
    hour = DateTime.parse(hour)

    hour >= start && hour < finish
  end
end