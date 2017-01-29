load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/lesser_burrow_orcs_script.rb", true

class LesserBurrowOrcsReturnScript < LesserBurrowOrcsScript
  protected

  def directions
    reverse_directions(super)
  end
end
