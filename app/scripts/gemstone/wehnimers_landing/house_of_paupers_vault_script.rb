load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/house_of_paupers_commons_script.rb", true

class HouseOfPaupersVaultScript < HouseOfPaupersCommonsScript
  protected

  def directions
    super + [
      'go steel door',
    ]
  end

  def location
    "house_of_paupers_vault|#{WEHNIMERS_LANDING}"
  end
end
