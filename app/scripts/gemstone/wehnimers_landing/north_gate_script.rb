load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/town_square_central_script.rb", true

class NorthGateScript < TownSquareCentralScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      EAST,
      NORTH,
      'go gate',
    ]
  end

  def location
    "north_gate|#{WEHNIMERS_LANDING}"
  end
end
