require_relative '../lib/board_ship'

Ship = Struct.new(:id, :location)

class StubShipGateway < Struct.new(:ships)
  def find_by_id(id)
    ships.find { |ship| ship.id == id }
  end

  def mark_as_boarded(id)
  end
end

class MockShipGateway
  def initialize(test)
    @test = test
    @mark_as_boarded = false
  end

  def find_by_id(id)
    Ship.new(id, :space)
  end

  def mark_as_boarded(id)
    @mark_as_boarded = true
  end

  def assert_mark_as_boarded!
    @test.expect(@mark_as_boarded).to @test.be true
  end
end

class SpyShipGateway
  attr_reader :find_by_id_called_with

  def initialize
    @find_by_id_called_with = []
  end

  def find_by_id(id)
    @find_by_id_called_with << id
    Ship.new(id, :space)
  end

  def mark_as_boarded(id)
  end
end

class FakeShipGateway
  def find_by_id(id)
    Ship.new(id, :space)
  end

  def mark_as_boarded(id)
  end
end

describe BoardShip do
  let(:ship_in_space) { Ship.new(1, :space) }
  let(:another_ship_in_space) { Ship.new(2, :space) }
  let(:ship_on_earth) { Ship.new(3, :earth) }

  it 'finds ships by id' do
    ship_gateway = SpyShipGateway.new
    board_ship = described_class.new(ship_gateway: ship_gateway)
    board_ship.execute(ship_in_space.id, another_ship_in_space.id)
    expect(ship_gateway.find_by_id_called_with.first).to eq(ship_in_space.id)
    expect(ship_gateway.find_by_id_called_with.last).to eq(another_ship_in_space.id)
  end

  it 'returns success if attacking ship can board defending ship' do
    ship_gateway = StubShipGateway.new([
      ship_in_space,
      another_ship_in_space
    ])
    board_ship = described_class.new(ship_gateway: ship_gateway)
    expect(board_ship.execute(ship_in_space.id, another_ship_in_space.id)).to be_success
  end

  it 'returns not successful if attacking ship cannot board defending ship' do
    ship_gateway = StubShipGateway.new([
      ship_in_space,
      ship_on_earth
    ])
    board_ship = described_class.new(ship_gateway: ship_gateway)
    expect(board_ship.execute(ship_in_space.id, ship_on_earth.id)).to_not be_success
  end

  it 'updates defending ship as boarded' do
    ship_gateway = MockShipGateway.new(self)
    board_ship = described_class.new(ship_gateway: ship_gateway)
    board_ship.execute(ship_in_space.id, another_ship_in_space.id)
    ship_gateway.assert_mark_as_boarded!
  end

  it 'it successfully boards ship' do
    ship_gateway = FakeShipGateway.new
    board_ship = described_class.new(ship_gateway: ship_gateway)
    expect(board_ship.execute(ship_in_space.id, another_ship_in_space.id)).to be_success
  end
end
