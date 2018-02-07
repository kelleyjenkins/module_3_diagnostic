class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(station = [])
    @name = station[:station_name]
    @address = station[:street_address]
    @fuel_type = station[:fuel_type_code]
    @distance = station[:distance]
    @access_times = station[:access_days_time]
  end
end
