class StationFacade

  def initialize(zip)
    @zip = zip.to_s
  end

  def stations(qty)
    conn = Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.adapter  Faraday.default_adapter
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?fuel_type=LPG,ELEC&api_key=#{ENV['NREL_API_KEY']}&location=#{@zip}")
    station_result = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    station_result[0...qty].map do |station_data|
      Station.new(station_data)
    end
  end
end
