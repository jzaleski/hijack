load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class HerbalistsTentScript < GreenScript
  protected

  def directions
    [
      SOUTHEAST,
      NORTH,
      "go tent|#{OUT}",
    ]
  end

  def location
    "herbalists_tent|#{NORTHERN_CARAVANSARY}"
  end
end
