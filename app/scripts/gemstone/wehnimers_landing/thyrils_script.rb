require 'scripts/gemstone/wehnimers_landing/town_square_central_script'

class ThyrilsScript < TownSquareCentralScript
  protected

  def directions
    [
      "go well|#{NORTH}",
      'climb rope',
      'go crevice',
    ]
  end

  def location
    "thyrils|#{WEHNIMERS_LANDING}"
  end
end
