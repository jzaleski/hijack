require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class BankScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      EAST,
      "go bank|#{OUT}",
    ]
  end

  def location
    "bank|#{ICEMULE_TRACE}"
  end

end
