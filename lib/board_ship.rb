class BoardShip
  Response = Struct.new(:success?)

  def initialize(ship_gateway:)
    @ship_gateway = ship_gateway
  end

  def execute(attacking_ship_id, defending_ship_id)
    attacking_ship = ship_gateway.find_by_id(attacking_ship_id)
    defending_ship = ship_gateway.find_by_id(defending_ship_id)

    if attacking_ship.location == defending_ship.location
      ship_gateway.mark_as_boarded(defending_ship.id)
      Response.new(true)
    else
      Response.new(false)
    end
  end

  private

  attr_reader :ship_gateway
end
