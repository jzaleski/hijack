load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class ExchangeBoothScript < TownSquareCentralScript
  protected

  def directions
    super + [
      EAST,
      EAST,
      EAST,
      NORTH,
      EAST,
      EAST,
      SOUTH,
      SOUTHEAST,
      EAST,
      EAST,
      NORTH,
      NORTH,
      EAST,
      "go booth|#{OUT}",
    ]
  end

  def location
    "exchange_booth|#{WEHNIMERS_LANDING}"
  end
end
