load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/hobgoblins_script.rb", true

class SpottedLynxScript < HobgoblinsScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTH,
      SOUTHEAST,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      'climb ridge',
      NORTHEAST,
      "go entrance|#{OUT}",
      'climb stair',
      'go hole',
      NORTHEAST,
      SOUTHEAST,
      NORTHEAST,
      SOUTHEAST,
      EAST,
      SOUTHEAST,
      DOWN,
      EAST,
      'climb landslide',
    ]
  end

  def location
    "spotted_lynx|#{WEHNIMERS_LANDING}"
  end
end
