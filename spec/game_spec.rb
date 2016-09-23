require './lib/game'
require './lib/player'


describe Game do
  subject(:game) {described_class.new}
  let(:ship) {Ship.new(:carrier, 5)}

  describe '#initialize' do
    it 'the game starts with a board' do
      expect(game.board).to be_an_instance_of Board
    end
    it 'the game starts with a player' do
      expect(game.player).to be_an_instance_of Player
    end
  end

  describe 'place_ship' do
    it 'takes four arguments: ship, x_coordinate, y_coordinate and direction' do
      expect(game).to respond_to(:place_ship).with(4).argument
    end
    it 'will throw an error if the argument is not a board coordinate' do
      expect{game.place_ship(ship, 10, 5, :up)}.to raise_error 'Not a valid coordinate'
    end
    it 'will throw an error if a ship object is not passed in' do
      expect{game.place_ship("not a ship", 0, 0, :up)}.to raise_error "Not a ship"
    end
    it 'will throw an error if a direction other than up, down, left or right' do
      expect{game.place_ship(ship, 0, 0, "diagonal")}.to raise_error "Not a valid direction"
    end
    it 'will not throw an error if a ship is passed, both coordinates are valid and direction is valid' do
      expect(game.place_ship(ship, 0, 0, :up)).to eq "OK"
    end
  end

  describe 'plot_ship' do
    it 'takes four arguments: ship, x_coordinate, y_coordinate' do
      expect(game).to respond_to(:plot_ship).with(4).arguments
    end
    it 'will replace the board coordinates with the ship name if direction is up' do
      expect(game.plot_ship(ship, 0, 0, :down)).to eq [
                                                                 [:carrier, :A2, :A3, :A4, :A5, :A6, :A7, :A8, :A9, :A10],
                                                                 [:carrier, :B2, :B3, :B4, :B5, :B6, :B7, :B8, :B9, :B10],
                                                                 [:carrier, :C2, :C3, :C4, :C5, :C6, :C7, :C8, :C9, :C10],
                                                                 [:carrier, :D2, :D3, :D4, :D5, :D6, :D7, :D8, :D9, :D10],
                                                                 [:carrier, :E2, :E3, :E4, :E5, :E6, :E7, :E8, :E9, :E10],
                                                                 [:F1, :F2, :F3, :F4, :F5, :F6, :F7, :F8, :F9, :F10],
                                                                 [:G1, :G2, :G3, :G4, :G5, :G6, :G7, :G8, :G9, :G10],
                                                                 [:H1, :H2, :H3, :H4, :H5, :H6, :H7, :H8, :H9, :H10],
                                                                 [:I1, :I2, :I3, :I4, :I5, :I6, :I7, :I8, :I9, :I10],
                                                                 [:J1, :J2, :J3, :J4, :J5, :J6, :J7, :J8, :J9, :J10]]
    end
    it 'will replace the board coordinates with the ship name if direction is down' do
      expect(game.plot_ship(ship, 5, 5, :up)).to eq [
                                                                 [:A1, :A2, :A3, :A4, :A5, :A6, :A7, :A8, :A9, :A10],
                                                                 [:B1, :B2, :B3, :B4, :B5, :carrier, :B7, :B8, :B9, :B10],
                                                                 [:C1, :C2, :C3, :C4, :C5, :carrier, :C7, :C8, :C9, :C10],
                                                                 [:D1, :D2, :D3, :D4, :D5, :carrier, :D7, :D8, :D9, :D10],
                                                                 [:E1, :E2, :E3, :E4, :E5, :carrier, :E7, :E8, :E9, :E10],
                                                                 [:F1, :F2, :F3, :F4, :F5, :carrier, :F7, :F8, :F9, :F10],
                                                                 [:G1, :G2, :G3, :G4, :G5, :G6, :G7, :G8, :G9, :G10],
                                                                 [:H1, :H2, :H3, :H4, :H5, :H6, :H7, :H8, :H9, :H10],
                                                                 [:I1, :I2, :I3, :I4, :I5, :I6, :I7, :I8, :I9, :I10],
                                                                 [:J1, :J2, :J3, :J4, :J5, :J6, :J7, :J8, :J9, :J10]]
    end
    it 'will replace the board coordinates with the ship name if direction is right' do
      expect(game.plot_ship(ship, 0, 0, :right)).to eq [
                                                                 [:carrier, :carrier, :carrier, :carrier, :carrier, :A6, :A7, :A8, :A9, :A10],
                                                                 [:B1, :B2, :B3, :B4, :B5, :B6, :B7, :B8, :B9, :B10],
                                                                 [:C1, :C2, :C3, :C4, :C5, :C6, :C7, :C8, :C9, :C10],
                                                                 [:D1, :D2, :D3, :D4, :D5, :D6, :D7, :D8, :D9, :D10],
                                                                 [:E1, :E2, :E3, :E4, :E5, :E6, :E7, :E8, :E9, :E10],
                                                                 [:F1, :F2, :F3, :F4, :F5, :F6, :F7, :F8, :F9, :F10],
                                                                 [:G1, :G2, :G3, :G4, :G5, :G6, :G7, :G8, :G9, :G10],
                                                                 [:H1, :H2, :H3, :H4, :H5, :H6, :H7, :H8, :H9, :H10],
                                                                 [:I1, :I2, :I3, :I4, :I5, :I6, :I7, :I8, :I9, :I10],
                                                                 [:J1, :J2, :J3, :J4, :J5, :J6, :J7, :J8, :J9, :J10]]
    end
    it 'will replace the board coordinates with the ship name if direction is left' do
      expect(game.plot_ship(ship, 5, 5, :left)).to eq [
                                                                 [:A1, :A2, :A3, :A4, :A5, :A6, :A7, :A8, :A9, :A10],
                                                                 [:B1, :B2, :B3, :B4, :B5, :B6, :B7, :B8, :B9, :B10],
                                                                 [:C1, :C2, :C3, :C4, :C5, :C6, :C7, :C8, :C9, :C10],
                                                                 [:D1, :D2, :D3, :D4, :D5, :D6, :D7, :D8, :D9, :D10],
                                                                 [:E1, :E2, :E3, :E4, :E5, :E6, :E7, :E8, :E9, :E10],
                                                                 [:F1, :carrier, :carrier, :carrier, :carrier, :carrier, :F7, :F8, :F9, :F10],
                                                                 [:G1, :G2, :G3, :G4, :G5, :G6, :G7, :G8, :G9, :G10],
                                                                 [:H1, :H2, :H3, :H4, :H5, :H6, :H7, :H8, :H9, :H10],
                                                                 [:I1, :I2, :I3, :I4, :I5, :I6, :I7, :I8, :I9, :I10],
                                                                 [:J1, :J2, :J3, :J4, :J5, :J6, :J7, :J8, :J9, :J10]]
    end
    it 'will throw an error if the ship will end off the board' do
      expect{game.plot_ship(ship, 0, 0, :up)}.to raise_error "You can't place the ship there"
    end
    it 'will throw an error if the ship will end off the board' do
      expect{game.plot_ship(ship, 9, 9, :down)}.to raise_error "You can't place the ship there"
    end
    it 'will throw an error if the ship will end off the board' do
      expect{game.plot_ship(ship, 0, 9, :right)}.to raise_error "You can't place the ship there"
    end
    it 'will throw an error if the ship will end off the board' do
      expect{game.plot_ship(ship, 0, 0, :left)}.to raise_error "You can't place the ship there"
    end
    end





end
