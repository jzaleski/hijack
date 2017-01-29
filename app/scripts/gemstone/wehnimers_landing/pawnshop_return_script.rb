load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/pawnshop_script.rb", true

class PawnshopReturnScript < PawnshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
