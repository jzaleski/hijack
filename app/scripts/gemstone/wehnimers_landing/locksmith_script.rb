load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class LocksmithScript < TownSquareCentralScript
  protected

  def directions
    super + [
      NORTHEAST,
      EAST,
      EAST,
      EAST,
      EAST,
      "go door|#{OUT}",
    ]
  end

  def location
    "locksmith|#{WEHNIMERS_LANDING}"
  end
end
