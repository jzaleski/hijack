require_reload 'scripts/gemstone/wehnimers_landing/hobgoblins_script'

class HobgoblinsReturnScript < HobgoblinsScript
  protected

  def directions
    reverse_directions(super)
  end
end
