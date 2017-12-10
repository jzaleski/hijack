load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class GeneralStoreScript < TownSquareCentralScript
  protected

  def directions
    super + [
      SOUTHEAST,
      "go store|#{OUT}",
    ]
  end

  def location
    "general_store|#{WEHNIMERS_LANDING}"
  end
end
