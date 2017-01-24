require_reload 'scripts/gemstone/icemule_trace/town_center_script'

class BankScript < TownCenterScript
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
