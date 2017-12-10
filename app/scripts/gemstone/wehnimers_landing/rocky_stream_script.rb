load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/stockade_gate_script.rb", true

class RockyStreamScript < StockadeGateScript
  protected

  def directions
    super + [
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
