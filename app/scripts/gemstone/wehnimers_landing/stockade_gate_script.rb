load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/deep_stream_script.rb", true

class StockadeGateScript < DeepStreamScript
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
    ]
  end

  def location
    "stockade_gate|#{WEHNIMERS_LANDING}"
  end
end
