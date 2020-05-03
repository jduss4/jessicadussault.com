class Forecast

  attr_reader :periods

  def initialize(daily: nil, hourly: nil)
    @periods = []
    combine_forecasts(daily, hourly)
  end

  def combine_forecasts(daily, hourly)
    hourly_periods = hourly["properties"]["periods"]
    hours_by_day = hourly_periods.group_by { |p| p["startTime"][/\d{4}-\d{2}-\d{2}/] }

    daily["properties"]["periods"].each do |period|
      # iterate through hours_by_day and add those which match range
      date = period["startTime"][/\d{4}-\d{2}-\d{2}/]
      possible_hours = hours_by_day[date]
      period["hours"] = possible_hours.select do |hour|
        contains_hour?(period["startTime"], period["endTime"], hour["startTime"])
      end
      @periods << period
    end

  end

  def contains_hour?(startTime, endTime, hour)
    startTime = DateTime.parse(startTime)
    endTime = DateTime.parse(endTime)
    hour = DateTime.parse(hour)

    hour >= startTime && hour < endTime
  end
end