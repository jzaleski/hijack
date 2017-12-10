load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class HouseOfPaupersScript < TownSquareCentralScript
  protected

  def directions
    super + [
      SOUTHWEST,
      'go walk',
    ]
  end

  def location
    "house_of_paupers|#{WEHNIMERS_LANDING}"
  end
end
