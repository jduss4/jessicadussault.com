module GeneralHelper

  def calc_range_margins(range)
    low = range["low"].to_i
    high = 100 - range["high"].to_i
    { "low" => low, "high" => high }
  end

  def cst(time, time_only: false)
    if time
      dt = DateTime.parse(time).utc
      dt = dt.in_time_zone("Central Time (US & Canada)")
      if time_only
        dt.strftime("%l:%M %P")
      else
        dt.strftime("%d %B %Y %l:%M %P")
      end
    end
  end

  def daytime?(daytime)
    if daytime
      "forecast_period forecast_period_day"
    else
      "forecast_period forecast_period_night"
    end
  end

  def temp_to_f(temp)
    if temp
      float = temp.to_f
      f = float*(9.0/5.0)+32
      "#{f.round}˚F"
    end
  end

  def weather_icon(icon_path)
    # https://api.weather.gov/icons/land/night/bkn
    URI(icon_path).path.split('/').last
  end

  # wind measured in degrees, 0 North, 90 East, 180 South, 270 West
  def wind_dir_desc(deg)
    if deg
      case deg.to_f
      when 0..22.5
        "N"
      when 22.6..67.5
        "NE"
      when 67.6..112.5
        "E"
      when 112.6..157.5
        "SE"
      when 157.6..202.5
        "S"
      when 202.6..247.5
        "SW"
      when 247.6..292.5
        "W"
      when 292.6..337.5
        "NW"
      when 337.6..360
        "N"
      else
        "?"
      end
    end
  end

end