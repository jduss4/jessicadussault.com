class GeneralController < ApplicationController

  @@nws = NwsConnector.new()

  def weather
    weather = @@nws.weather("lincoln")
    @current = weather[:current]["properties"]
    @info = weather[:forecast]
    @update = weather[:update].strftime("%Y %B %d, %H:%I%P")
  end

end