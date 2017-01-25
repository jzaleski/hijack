require 'scripts/gemstone/wehnimers_landing/north_gate_script'

class WestGateScript < NorthGateScript
  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "west_gate|#{WEHNIMERS_LANDING}"
  end
end
