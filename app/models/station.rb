class Station
  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_times

  def initialize(args)
    @name = args[:station_name]
    @address = args[:street_address]
    @fuel_types = args[:fuel_type_code]
    @distance = args[:distance]
    @access_times = args[:access_days_time]
  end
end
