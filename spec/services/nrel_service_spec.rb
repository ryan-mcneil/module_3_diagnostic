require 'rails_helper'

describe 'NrelService' do
  it 'exists' do
    service = NrelService.new(80203)

    expect(service).to be_a(NrelService)
  end

end
