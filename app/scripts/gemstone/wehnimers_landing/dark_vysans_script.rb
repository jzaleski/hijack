load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/underground_ruin_stone_steps_script.rb", true

class DarkVysansScript < UndergroundRuinStoneStepsScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTHEAST,
      EAST,
      SOUTH,
      SOUTH,
      'go hole',
      'go opening',
    ]
  end

  def location
    "dark_vysans|#{WEHNIMERS_LANDING}"
  end
end
