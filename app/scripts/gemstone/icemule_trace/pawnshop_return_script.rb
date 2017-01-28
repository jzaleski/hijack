load "#{APP_DIR}/scripts/gemstone/icemule_trace/pawnshop_script.rb", true

class PawnshopReturnScript < PawnshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
