# Sweater Weather
A Turing School solo project created with Rails.

[SweaterWeatherAPI](http://sweaterweatherapi.herokuapp.com/api/v1)

Contributors:
* Bradley Niedt


# About Sweater Weather

The Sweater Weather app is your one stop json-shop for weather data and weather-related gifs. The api requires a free account to access it, but once unlocked, allows the user access to data synthesized from the DarkSky, Giphy, and Google Geocode APIs. Users can also favorite locations, pull the current weather for their list of favorite locations, and get gif weather forecasts.


## Getting Started - Prerequisites

You will need Rails v 5.2.2.
```
gem install rails -v 5.2.2
```

### Clone down

* `git clone https://github.com/Bradniedt/SweaterWeather.git`
* `cd SweaterWeather`
* Make sure your gemfile is up to date:

```
bundle
bundle update
```
* Establish a database:

```
rake db:{drop,create,migrate}
```
* Build your application.yml file:

```
bundle exec figaro install
```

###### Enter API Keys into your `config/application.yml` file:

* DarkSky defined within as `ENV['YELP_API_KEY']`
* Giphy defined within as `ENV['MAPBOX_KEY']`
* Google Geocode defined within as `ENV['NREL_API_KEY']`

* Update your gemfile:

```
bundle
bundle update
```
* Establish a database:

```
rake db:{create,migrate}
```

## Getting API Data

To access the various endpoints, you'll need to start your server:

```
rails s
```

## Examples
### Forecast endpoint : /api/v1/forecast

```
GET https://sweaterweatherapi.herokuapp.com/api/v1/forecast?location=denver,co
```

```
{
    "data": {
        "id": "1",
        "type": "forecast",
        "attributes": {
            "id": 1,
            "timezone": "America/Denver",
            "currently": {
                "time": 1551242422,
                "summary": "Partly Cloudy",
                "icon": "partly-cloudy-night",
                "nearestStormDistance": 55,
                "nearestStormBearing": 339,
                "precipIntensity": 0,
                "precipProbability": 0,
                "temperature": 37.81,
                "apparentTemperature": 33.35,
                "dewPoint": 26.07,
                "humidity": 0.62,
                "pressure": 1017.56,
                "windSpeed": 5.72,
                "windGust": 5.72,
                "windBearing": 106,
                "cloudCover": 0.28,
                "uvIndex": 0,
                "visibility": 7.55,
                "ozone": 258.47
            },
            "daily": {
                "summary": "Snow (2–4 in.) on Friday and Saturday, with high temperatures peaking at 57°F on Thursday.",
                "icon": "snow",
                "data": [
                    {
                    daily data points
                    }
                ]
            },
            "hourly": {
                "summary": "Mostly cloudy starting tonight.",
                "icon": "partly-cloudy-day",
                "data": [
                    hourly data points
                    }
                ]
            }
        }
    }
}
```

### Registration endpoint : /api/v1/users
You will need to register to receive an API key to access the favorites and giphy endpoints.

```
GET http://sweaterweatherapi.herokuapp.com/api/v1/users?email=janebob@email.com&password=pass&password_confirmation=pass
```

```
{
    "data": {
        "id": "5",
        "type": "api",
        "attributes": {
            "api_key": "YOUR_KEY_HERE"
        }
    }
}
```

### Log in endpoint : /api/v1/sessions
You can access your api key at any time by sending a POST request to the following endpoint:

```
POST https://sweaterweatherapi.herokuapp.com/api/v1/sessions?email=joe@email.com&password=pass
```

```
{
    "data": {
        "id": "5",
        "type": "api",
        "attributes": {
            "api_key": "YOUR_KEY_HERE"
        }
    }
}
```


### Favoriting locaitons : /api/v1/favorites
You can favorite a location at any time by sending a POST request to the following endpoint:

```
POST https://sweaterweatherapi.herokuapp.com/api/v1/favorites?location=Denver,CO&api_key=YOUR_API_KEY_HERE
```

```
{}
```

### Listing favorite locations with current weather : /api/v1/favorites
You can favorite a location at any time by sending a POST request to the following endpoint:

```
GET https://sweaterweatherapi.herokuapp.com/api/v1/favorites?api_key=YOUR_API_KEY_HERE
```

```
{
    "data": {
        "id": "1",
        "type": "favorite",
        "attributes": {
            "favorites": [
                {
                    "location": "Denver,co",
                    "current_weather": {
                        "time": 1551244008,
                        "summary": "Clear",
                        "icon": "clear-night",
                        "nearestStormDistance": 300,
                        "nearestStormBearing": 15,
                        "precipIntensity": 0,
                        "precipProbability": 0,
                        "temperature": 37.52,
                        "apparentTemperature": 32.66,
                        "dewPoint": 27.09,
                        "humidity": 0.66,
                        "pressure": 1017.01,
                        "windSpeed": 6.21,
                        "windGust": 6.21,
                        "windBearing": 155,
                        "cloudCover": 0.07,
                        "uvIndex": 0,
                        "visibility": 8.15,
                        "ozone": 258.04
                    }
                },
                {
                    "location": "Durango,co",
                    "current_weather": {
                        "time": 1551244009,
                        "summary": "Clear",
                        "icon": "clear-night",
                        "nearestStormDistance": 304,
                        "nearestStormBearing": 320,
                        "precipIntensity": 0,
                        "precipProbability": 0,
                        "temperature": 30.1,
                        "apparentTemperature": 25.94,
                        "dewPoint": 15.04,
                        "humidity": 0.53,
                        "pressure": 1027.53,
                        "windSpeed": 3.95,
                        "windGust": 4.08,
                        "windBearing": 318,
                        "cloudCover": 0,
                        "uvIndex": 0,
                        "visibility": 10,
                        "ozone": 254.83
                    }
                }
            ]
        }
    }
}
```

### Favoriting locaitons : /api/v1/favorites
You can remove a favorite location at any time by sending a DELETE request to the following endpoint:

```
DELETE https://sweaterweatherapi.herokuapp.com/api/v1/favorites?location=Denver,CO&api_key=YOUR_API_KEY_HERE
```

```
{
    "data": {
        "id": "1",
        "type": "favorite",
        "attributes": {
            "favorites": [
                {
                    "location": "Denver,co",
                    "current_weather": {
                        "time": 1551244183,
                        "summary": "Clear",
                        "icon": "clear-night",
                        "nearestStormDistance": 300,
                        "nearestStormBearing": 15,
                        "precipIntensity": 0,
                        "precipProbability": 0,
                        "temperature": 37.43,
                        "apparentTemperature": 32.68,
                        "dewPoint": 27.01,
                        "humidity": 0.66,
                        "pressure": 1017.04,
                        "windSpeed": 6.02,
                        "windGust": 6.02,
                        "windBearing": 158,
                        "cloudCover": 0.08,
                        "uvIndex": 0,
                        "visibility": 8.16,
                        "ozone": 258
                    }
                }
            ]
        }
    }
}
```

### Gif weather endpoint : /api/v1/gifs
You can retrieve location-based gifs that correspond to the daily weather lineup by sending a GET request to the following endpoint:

```
GET https://sweaterweatherapi.herokuapp.com/api/v1/favorites?location=Denver,CO&api_key=YOUR_API_KEY_HERE
```

```
{
    "data": {
        "id": "1",
        "type": "gif",
        "attributes": {
            "images": [
                {
                    "time": "1551164400",
                    "summary": "Foggy in the morning.",
                    "url": "https://giphy.com/gifs/quote-sky-morning-SWYSIUQOD5XW"
                },
                {
                    "time": "1551250800",
                    "summary": "Mostly cloudy throughout the day.",
                    "url": "https://giphy.com/gifs/clouds-love-cute-qq5gwamAHVofm"
                },
                {
                    "time": "1551337200",
                    "summary": "Mostly cloudy throughout the day.",
                    "url": "https://giphy.com/gifs/dark-castle-63xBFHKNVjZlu"
                },
                {
                    "time": "1551423600",
                    "summary": "Snow (1–2 in.) starting in the evening.",
                    "url": "https://giphy.com/gifs/snow-night-winter-PkaZUCdVm2c5G"
                },
                {
                    "time": "1551510000",
                    "summary": "Snow (< 1 in.) starting in the afternoon, continuing until evening.",
                    "url": "https://giphy.com/gifs/topgear-bbc-top-gear-65WGIINB4VfA1JuXCH"
                },
                {
                    "time": "1551596400",
                    "summary": "Light snow (< 1 in.) starting in the afternoon, continuing until evening.",
                    "url": "https://giphy.com/gifs/good-afternoon-evening-BjQTWPEVZjM6Q"
                },
                {
                    "time": "1551682800",
                    "summary": "Foggy starting in the evening.",
                    "url": "https://giphy.com/gifs/justintimberlake-justin-timberlake-cry-me-a-river-3ohs4z5cMb6083uW3u"
                },
                {
                    "time": "1551769200",
                    "summary": "Partly cloudy throughout the day.",
                    "url": "https://giphy.com/gifs/pretty-sky-gorgeous-alEGxmahCCywE"
                }
            ],
            "copyright": "2019"
        }
    }
}
```

## Running the Test Suite

* Make sure RSpec is ready:

```
bundle exec rspec
```

* Run the test suite:
```
rspec
```
Once the test suite finishes, it will show you how many tests passed. All tests should pass with
green text. Tests that have errors or fail will be red text, and skipped tests will be yellow text.

## Deployment

This app is deployed on heroku at: [SweaterWeatherAPI](https://sweaterweatherapi.herokuapp.com/api/v1/)

## Created with

* `Rails`
* `Ruby`

### Gems:
* `faraday`
* `figaro`
* `fast_jsonapi`
* `bcrypt`
* `vcr`
