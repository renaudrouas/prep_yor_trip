require 'rest-client'

# How to ?
# weather = Weather.new("Paris,FR", "2018-05-24", 2018-05-25).call
# weather.temp # => 18°
#
class Weather
  def initialize(city,start_date,end_date)
    base_url = "https://api.weatherbit.io/v2.0/history/daily"
    params = "?city=#{city}&start_date=#{start_date}&end_date=#{end_date}"
    key = "&key=#{ENV.fetch('WEATHER_API_KEY')}"
    @url = base_url + params + key
  end

  def call
    response = JSON.parse(RestClient.get @url)
    data = response["data"].first

    OpenStruct.new(
      max_temp: data["max_temp"],
      min_temp: data["min_temp"],
      temp: data["temp"],
      precip: data["precip"],
    )
  end
end