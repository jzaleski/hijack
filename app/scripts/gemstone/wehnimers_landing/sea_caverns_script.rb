load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/wooden_signpost_script.rb", true

class SeaCavernsScript < WoodenSignpostScript
  protected

  def directions
    super + [
      NORTHWEST,
      NORTH,
      NORTHEAST,
      'climb pine|climb tree',
      EAST,
      EAST,
      SOUTHEAST,
      EAST,
      EAST,
      "go hole|#{OUT}",
    ]
  end

  def location
    "sea_caverns|#{WEHNIMERS_LANDING}"
  end
end
