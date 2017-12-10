load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class ArmoryScript < TownSquareCentralScript
  protected

  def directions
    super + [
      SOUTHWEST,
      WEST,
      "go door|#{OUT}",
    ]
  end

  def location
    "armory|#{WEHNIMERS_LANDING}"
  end
end
