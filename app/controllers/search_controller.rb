class SearchController < ApplicationController
  def index
    # @search = StationSearch.new(params[:zip_code])

    conn = Faraday.new(url: "https://developer.nrel.gov/") do |faraday|
      faraday.headers['X-API-Key'] = ENV["ALTFUEL_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=80203")

    @search = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    [:fuel_stations].map do |station|
      Station.new(station)
    end
  end
end

class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(station = {})
    @name = station[:station_name]
    @address = station[:street_address]
    @fuel_type = station[:fuel_type_code]
    @distance = station[:distance]
    @access_times = station[:access_days_time]
  end
end
