load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/lesser_orcs_script.rb", true

class LesserOrcsReturnScript < LesserOrcsScript
  protected

  def directions
    reverse_directions(super)
  end
end
