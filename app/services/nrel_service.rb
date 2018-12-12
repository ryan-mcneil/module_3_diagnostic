class NrelService

  def initialize(zip)
    @qty = zip
  end

  def station_result
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?fuel_type=LPG,ELEC&api_key=#{ENV['NREL_API_KEY']}&location=#{@zip}")
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.adapter  Faraday.default_adapter
    end
  end

end
