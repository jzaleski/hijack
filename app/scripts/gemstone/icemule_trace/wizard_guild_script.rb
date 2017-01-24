require_reload 'scripts/gemstone/icemule_trace/town_center_script'

class WizardGuildScript < TownCenterScript
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
