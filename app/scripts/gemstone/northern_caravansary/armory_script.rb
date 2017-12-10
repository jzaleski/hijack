load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class ArmoryScript < GreenScript
  protected

  def directions
    super + [
      SOUTH,
      EAST,
      "go steps|#{OUT}",
    ]
  end

  def location
    "armory|#{NORTHERN_CARAVANSARY}"
  end
end
