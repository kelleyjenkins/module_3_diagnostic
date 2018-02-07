# class StationSearchService
#   attr_reader :location
#
#   def initialize(location)
#     @location = location
#
#     @conn = Faraday.new(url: "https://developer.nrel.gov/") do |faraday|
#       faraday.headers['X-API-Key'] = ENV["ALTFUEL_API_KEY"]
#       faraday.adapter Faraday.default_adapter
#     end
#   end
#
#   def response
#     response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?limit=10&fuel-type=ELEC&fuel-type=LPG&#{params[:location]}")
#       @results = JSON.parse(response.body, symbolize_names: true)[:fuel_stations].map do |station|
#         Station.new(station)
#       end
#   end
#
# end
