load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/dark_orcs_script.rb", true

class DarkOrcsReturnScript < DarkOrcsScript
  protected

  def directions
    reverse_directions(super)
  end
end
