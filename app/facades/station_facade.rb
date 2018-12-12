class StationFacade

  def initialize(zip)
    @zip = zip.to_s
  end

  def stations
    conn = Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.adapter  Faraday.default_adapter
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?fuel_type=LPG,ELEC&api_key=#{ENV['NREL_API_KEY']}&location=#{@zip}")
    parsed_json = Json.parse(response.body, symbolize_names: true)
  end
end
