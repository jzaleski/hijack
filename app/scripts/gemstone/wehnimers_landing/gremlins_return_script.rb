require_reload 'scripts/gemstone/wehnimers_landing/gremlins_script'

class GremlinsReturnScript < GremlinsScript
  protected

  def directions
    reverse_directions(super)
  end
end
