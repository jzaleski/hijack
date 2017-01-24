require_reload 'scripts/gemstone/wehnimers_landing/fire_salamanders_script'

class FireSalamandersReturnScript < FireSalamandersScript
  protected

  def directions
    reverse_directions(super)
  end
end
