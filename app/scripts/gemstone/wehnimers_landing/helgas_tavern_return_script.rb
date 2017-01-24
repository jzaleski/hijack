require_reload 'scripts/gemstone/wehnimers_landing/helgas_tavern_script'

class HelgasTavernReturnScript < HelgasTavernScript
  protected

  def directions
    reverse_directions(super)
  end
end
