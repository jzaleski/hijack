load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/lesser_orcs_script.rb", true

class LesserBurrowOrcsScript < LesserOrcsScript
  protected

  def location
    "lesser_burrow_orcs|#{WEHNIMERS_LANDING}"
  end
end
