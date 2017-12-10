load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class PawnshopScript < GreenScript
  protected

  def directions
    super + [
      SOUTH,
      WEST,
      "go stairs|#{OUT}",
    ]
  end

  def location
    "pawnshop|#{NORTHERN_CARAVANSARY}"
  end
end
