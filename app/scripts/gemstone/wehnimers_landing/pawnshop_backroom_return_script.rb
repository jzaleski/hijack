load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/pawnshop_backroom_script.rb", true

class PawnshopBackroomReturnScript < PawnshopBackroomScript
  protected

  def directions
    reverse_directions(super)
  end
end
