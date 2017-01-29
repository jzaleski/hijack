load "#{SCRIPTS_DIR}/gemstone/solhaven/pawnshop_script.rb", true

class PawnshopReturnScript < PawnshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
