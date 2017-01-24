require_reload 'scripts/gemstone/wehnimers_landing/glatoph_script'

class FirephantomsScript < GlatophScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      NORTHWEST,
      NORTHWEST,
      'go gash|go mouth',
      DOWN,
      DOWN,
      DOWN,
      DOWN,
      SOUTHEAST,
      "climb arch|#{NORTHEAST}",
    ]
  end

  def location
    "firephantoms|#{WEHNIMERS_LANDING}"
  end
end
