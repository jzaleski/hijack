load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class ThyrilsScript < TownSquareCentralScript
  protected

  def directions
    super + [
      "go well|#{NORTH}",
      'climb rope',
      'go crevice',
    ]
  end

  def location
    "thyrils|#{WEHNIMERS_LANDING}"
  end
end
