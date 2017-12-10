load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class StockadeGateScript < GreenScript
  protected

  def directions
    super + [
      NORTH,
      'go gate',
    ]
  end

  def location
    "stockade_gate|#{NORTHERN_CARAVANSARY}"
  end
end
