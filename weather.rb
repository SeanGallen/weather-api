require 'httparty'

class Weather
  attr_accessor :city, :parsed_response

  def initialize(input_city)
    @city= input_city
    @parsed_response = httparty
  end

  def city_id
    city = {'Chicago' => '4887398',
            'Moscow' => '524901'}
  end

  def httparty
    HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/city?id=#{city_id[city]}&APPID={APIKEY}).parsed_response
  end

  def city_name
    parsed_response["city"]["name"]
  end

  def current_weather
    parsed_response["list"][0]["weather"][0]["description"]
  end

  def output_text
    "You asked for the weather in #{city_name}.\nYou can look forward to a #{current_weather}."
  end

end

response = Weather.new("Chicago")
puts response.output_text

#http://api.openweathermap.org/data/2.5/forecast/city?id=524901&APPID={APIKEY}

# Command line file that allows me to see Chicago's weather.
# make a variable for the city id for later.
# output will be slightly readable.
# ["city", "cod", "message", "cnt", "list"]


# CommandLine
#   ARGV.join("")
# end
