load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/hobgoblins_script.rb", true

class SlimyLittleGrubsScript < HobgoblinsScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTH,
      SOUTHEAST,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      EAST,
      "go pass|#{SOUTHEAST}",
      'go trail',
      'climb ravine',
    ]
  end

  def location
    "slimy_little_grubs|#{WEHNIMERS_LANDING}"
  end
end
