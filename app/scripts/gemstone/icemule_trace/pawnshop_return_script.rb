require_reload 'scripts/gemstone/icemule_trace/pawnshop_script'

class PawnshopReturnScript < PawnshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
