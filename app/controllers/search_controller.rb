class SearchController < ApplicationController
  def index
    @search = StationSearch.new(params[:zip_code])

    conn = Faraday.new(url: "https://api.alt-fuel-stations/v1/nearest") do |faraday|
      faraday.headers['X-API-Key'] = ENV["ALTFUEL_API_KEY"]
      faraday.adapter Faraday.default_adapter


  end
end
