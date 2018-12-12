class StationFacade

  def initialize(zip)
    @zip = zip.to_s
  end

  def stations
    response = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |f|
      f.headers['api-key'] = ENV['NREL_API_KEY']
      f.headers['fuel_type'] = 'LPG,ELEC'
      f.headers['location'] = @zip
      f.adapter  Faraday.default_adapter
    end
    binding.pry
  end
end
