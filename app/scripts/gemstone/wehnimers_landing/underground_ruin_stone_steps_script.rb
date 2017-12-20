load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_nymphs_script.rb", true

class UndergroundRuinStoneStepsScript < SeaNymphsScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTHWEST,
      SOUTH,
      EAST,
      SOUTHEAST,
      SOUTHWEST,
      SOUTH,
      SOUTHEAST,
      'go steps',
    ]
  end

  def location
    "underground_ruin_stone_steps|#{WEHNIMERS_LANDING}"
  end
end
