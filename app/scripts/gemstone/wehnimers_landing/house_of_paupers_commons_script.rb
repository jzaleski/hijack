load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/house_of_paupers_script.rb", true

class HouseOfPaupersCommonsScript < HouseOfPaupersScript
  protected

  def directions
    super + [
      'go gate',
      'go doors',
      'go ora door',
    ]
  end

  def location
    "house_of_paupers_commons|#{WEHNIMERS_LANDING}"
  end
end
