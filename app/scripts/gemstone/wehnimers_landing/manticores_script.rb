load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class ManticoresScript < RottedWoodenSignpostScript
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
      NORTHEAST,
      NORTH,
      'go rockslide',
    ]
  end

  def location
    "manticores|#{WEHNIMERS_LANDING}"
  end
end
