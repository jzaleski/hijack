load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/town_square_central_script.rb", true

class GemshopScript < TownSquareCentralScript
  protected

  def directions
    [
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      EAST,
      "go shop|#{OUT}",
    ]
  end

  def location
    "gemshop|#{WEHNIMERS_LANDING}"
  end
end
