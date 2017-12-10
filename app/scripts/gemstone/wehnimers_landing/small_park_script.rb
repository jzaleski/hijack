load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class SmallParkScript < TownSquareCentralScript
  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTH,
    ]
  end

  def location
    "small_park|#{WEHNIMERS_LANDING}"
  end
end
