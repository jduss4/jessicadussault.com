class GeneralController < ApplicationController

  @@nws = NwsConnector.new()

  def weather
    forecast = @@nws.forecast("lincoln")
    @update = forecast[:update]
    @info = forecast[:forecast]
  end

end