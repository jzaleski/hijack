load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class ClericsTentScript < GreenScript
  protected

  def directions
    [
      SOUTHWEST,
      NORTH,
      "go tent|#{OUT}",
    ]
  end

  def location
    "clerics_tent|#{NORTHERN_CARAVANSARY}"
  end
end
