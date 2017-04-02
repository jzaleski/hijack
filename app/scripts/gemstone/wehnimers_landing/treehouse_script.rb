load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class TreehouseScript < TownSquareCentralScript
  protected

  def directions
    [
      "climb tree|#{UP}",
    ]
  end

  def location
    "treehouse|#{WEHNIMERS_LANDING}"
  end
end
