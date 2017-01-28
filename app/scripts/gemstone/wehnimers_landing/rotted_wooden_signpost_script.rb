load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/north_gate_script.rb", true

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
