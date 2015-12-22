require 'spec_helper'

describe Apix do
  it 'has a version number' do
    expect(Apix::VERSION).not_to be nil
  end

  it 'does something useful' do
    Apix.Q_CELL_CORE_KEY = '#'
    expect(Apix.get_location_by_phone('15201280641')['error_code']).to eq(0)
  end
end
