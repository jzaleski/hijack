require_reload 'scripts/gemstone/wehnimers_landing/rotted_wooden_signpost_script'

class HobgoblinsScript < RottedWoodenSignpostScript
  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      "#{SOUTH}|go path",
      SOUTH,
      "#{WEST}|go clearing",
      'go footpath',
    ]
  end

  def location
    "hobgoblins|#{WEHNIMERS_LANDING}"
  end
end
