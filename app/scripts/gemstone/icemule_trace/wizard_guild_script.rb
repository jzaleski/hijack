load "#{APP_DIR}/scripts/gemstone/icemule_trace/town_center_script.rb", true

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
