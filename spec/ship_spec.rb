require 'ship'

describe Ship do

describe '#initialize' do
  it 'has a ship type and size' do
    ship = Ship.new(:carrier, 5)
    expect(ship.type).to eq :carrier
    expect(ship.size).to eq 5
  end
end




end
