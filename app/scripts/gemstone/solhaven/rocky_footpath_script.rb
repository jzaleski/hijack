require_reload 'scripts/gemstone/solhaven/breach_script'

class RockyFootpathScript < BreachScript
  protected

  def directions
    super + [
      'go door',
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      SOUTHWEST,
      WEST,
      WEST,
      WEST,
    ]
  end

  def location
    "rocky_footpath|#{SOLHAVEN}"
  end
end
