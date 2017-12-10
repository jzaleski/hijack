load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class BankScript < TownSquareCentralScript
  protected

  def directions
    super + [
      WEST,
      "go bank|#{OUT}",
      'go arch',
    ]
  end

  def location
    "bank|#{WEHNIMERS_LANDING}"
  end
end
