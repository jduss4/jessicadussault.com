class GeneralController < ApplicationController

  @@nws = NwsConnector.new()

  def weather
    weather = @@nws.weather("lincoln")
    @current = weather[:current]
    @info = weather[:forecast]
    @update = weather[:update]
  end

end