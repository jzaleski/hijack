require 'scripts/gemstone/wehnimers_landing/town_square_central_script'

class BankScript < TownSquareCentralScript
  protected

  def directions
    [
      WEST,
      "go bank|#{OUT}",
      'go arch',
    ]
  end

  def location
    "bank|#{WEHNIMERS_LANDING}"
  end
end
