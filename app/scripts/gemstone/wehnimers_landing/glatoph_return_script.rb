require_reload 'scripts/gemstone/wehnimers_landing/glatoph_script'

class GlatophReturnScript < GlatophScript
  protected

  def directions
    reverse_directions(super)
  end
end
