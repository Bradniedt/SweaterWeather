require 'rails_helper'

describe 'Forecast API' do
  it 'should return JSON data for a forecast' do
    get  '/api/v1/forecast?location=denver,co'

    data = JSON.parse(response.body)
    expect(response).to be_successful
    expect(data).to have_key("city")
    expect(data).to have_key("state")
    expect(data).to have_key("country")
    expect(data).to have_key("latitude")
    expect(data).to have_key("longitude")
    expect(data).to have_key("current_weather_type")
    expect(data).to have_key("current_temp")
    expect(data).to have_key("high_temp")
    expect(data).to have_key("low_temp")
    expect(data).to have_key("feels_like")
    expect(data).to have_key("humidity")
    expect(data).to have_key("visibility")
    expect(data).to have_key("uv_index")
    expect(data).to have_key("today_sentence")
    expect(data).to have_key("tonight_sentence")
    expect(data).to have_key("daily")
    expect(data).to have_key("hourly")
    expect(data).to have_key("photo")
  end
end
