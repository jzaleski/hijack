load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class CaveNippersScript < RottedWoodenSignpostScript
  protected

  def directions
    super + [
      SOUTHEAST,
      EAST,
      EAST,
      'go bridge',
      'go bank',
      NORTHEAST,
      NORTHEAST,
      NORTH,
      WEST,
      NORTHEAST,
      NORTH,
      NORTHEAST,
      NORTHEAST,
      NORTH,
      NORTH,
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
    "cave_nippers|#{WEHNIMERS_LANDING}"
  end
end
