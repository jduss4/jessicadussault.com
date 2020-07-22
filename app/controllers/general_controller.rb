class GeneralController < ApplicationController

  def weather
    # Location object
    lnk = @@weather.status("lincoln")
    # NwsConnection objects
    @alerts = lnk.alerts
    @current = lnk.current.get_json["properties"]
    # Forecast object
    @forecast = lnk.forecast
  end

end