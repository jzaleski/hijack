load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class HouseOfPaupersOuterGroundsScript < TownSquareCentralScript
  protected

  def directions
    super + [
      SOUTHWEST,
      'go walkway',
    ]
  end

  def location
    "house_of_paupers_outer_grounds|#{WEHNIMERS_LANDING}"
  end
end
