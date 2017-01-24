require_reload 'scripts/gemstone/wehnimers_landing/dark_orcs_script'

class DarkOrcsReturnScript < DarkOrcsScript
  protected

  def directions
    reverse_directions(super)
  end
end
