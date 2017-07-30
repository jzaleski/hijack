load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/deep_stream_script.rb", true

class RockyStreamScript < DeepStreamScript
  protected

  def directions
    super + [
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
