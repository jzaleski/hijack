load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/underground_ruin_stone_steps_script.rb", true

class LesserRedOrcsScript < UndergroundRuinStoneStepsScript
  protected

  def location
    "lesser_red_orcs|#{WEHNIMERS_LANDING}"
  end
end
