load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class RockyStreamScript < RottedWoodenSignpostScript
  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      "#{SOUTH}|go path",
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHWEST,
      WEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      NORTHEAST,
      NORTHEAST,
      EAST,
      EAST,
      'go bridge',
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      EAST,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      EAST,
      SOUTHWEST,
      SOUTHWEST,
      EAST,
      SOUTHEAST,
      SOUTHWEST,
      WEST,
      SOUTHWEST,
      EAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
    ]
  end

  def location
    "rocky_stream|#{WEHNIMERS_LANDING}"
  end
end
