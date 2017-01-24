require_reload 'scripts/gemstone/wehnimers_landing/cave_nippers_script'

class CaveNippersReturnScript < CaveNippersScript
  protected

  def directions
    reverse_directions(super)
  end
end
