load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/town_square_central_script.rb", true

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
