load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class VolnScript < RottedWoodenSignpostScript
  protected

  def directions
    super + [
      SOUTHEAST,
      EAST,
      EAST,
      'go bridge',
      EAST,
      NORTHEAST,
      NORTH,
      NORTH,
      'go trail',
      EAST,
      EAST,
      EAST,
    ]
  end

  def location
    "voln|#{WEHNIMERS_LANDING}"
  end
end
