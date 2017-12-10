load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class TavernScript < GreenScript
  protected

  def directions
    super + [
      SOUTH,
      "go stairs|#{OUT}",
    ]
  end

  def location
    "tavern|#{NORTHERN_CARAVANSARY}"
  end
end
