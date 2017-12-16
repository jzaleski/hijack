load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class WoodenSignpostScript < RottedWoodenSignpostScript
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
    ]
  end

  def location
    "wooden_signpost|#{WEHNIMERS_LANDING}"
  end
end
