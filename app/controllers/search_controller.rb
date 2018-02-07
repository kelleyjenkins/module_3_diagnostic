class SearchController < ApplicationController
  def index
    # @search = StationSearch.new(params[:zip_code])

    conn = Faraday.new(url: "https://developer.nrel.gov/") do |faraday|
      faraday.headers['X-API-Key'] = ENV["ALTFUEL_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?#{params[:location]}")

    @search = JSON.parse(response.body, symbolize_names: true)[:results].map do |station|
      Station.new(station)
    end
  end
end
