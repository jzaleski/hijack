load "#{SCRIPTS_DIR}/gemstone/icemule_trace/pawnshop_script.rb", true

class PawnshopReturnScript < PawnshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
