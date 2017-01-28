load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/dark_orcs_script.rb", true

class DarkOrcsReturnScript < DarkOrcsScript
  protected

  def directions
    reverse_directions(super)
  end
end
