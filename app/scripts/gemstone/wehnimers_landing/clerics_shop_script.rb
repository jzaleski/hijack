load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class ClericsShopScript < TownSquareCentralScript
  protected

  def directions
    super + [
      EAST,
      EAST,
      EAST,
      SOUTH,
      SOUTH,
      "go shop|#{OUT}",
    ]
  end

  def location
    "clerics_shop|#{WEHNIMERS_LANDING}"
  end
end
