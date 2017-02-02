load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/pawnshop_script.rb", true

class PawnshopBackroomScript < PawnshopScript
  protected

  def directions
    super + [
      "go door|#{OUT}",
    ]
  end

  def location
    "pawnshop_backroom|#{WEHNIMERS_LANDING}"
  end
end
