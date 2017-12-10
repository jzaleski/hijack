load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class MagicTentScript < GreenScript
  protected

  def directions
    [
      NORTHEAST,
      SOUTH,
      "go tent|#{OUT}",
    ]
  end

  def location
    "magic_tent|#{NORTHERN_CARAVANSARY}"
  end
end
