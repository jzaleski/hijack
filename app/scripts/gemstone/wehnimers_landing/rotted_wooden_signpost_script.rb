require 'scripts/gemstone/wehnimers_landing/north_gate_script'

class RottedWoodenSignpostScript < NorthGateScript
  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "rotted_wooden_signpost|#{WEHNIMERS_LANDING}"
  end
end
