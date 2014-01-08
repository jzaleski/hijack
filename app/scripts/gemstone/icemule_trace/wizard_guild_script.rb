require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class WizardGuildScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      NORTH,
      WEST,
      NORTHWEST,
      NORTHEAST,
      'go gate',
    ]
  end

  def location
    "wizard_guild|#{ICEMULE_TRACE}"
  end

end
