load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/north_gate_script.rb", true

class DarkstonePoolScript < NorthGateScript
  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTH,
      WEST,
      WEST,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      WEST,
      WEST,
      UP,
      SOUTHWEST,
      'go path',
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTH,
    ]
  end

  def location
    "darkstone_pool|#{WEHNIMERS_LANDING}"
  end
end
