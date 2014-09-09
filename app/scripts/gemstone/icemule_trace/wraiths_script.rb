require 'scripts/gemstone/icemule_trace/abandoned_farm_script'

class WraithsScript < AbandonedFarmScript
  protected

  def directions
    super + [
      'go barn|go door',
    ]
  end

  def location
    "wraiths|#{ICEMULE_TRACE}"
  end
end
