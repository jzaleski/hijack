load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/stockade_gate_script.rb", true

class NorthernCaravansaryScript < StockadeGateScript
  protected

  def directions
    super + [
      'go gate',
      SOUTH,
    ]
  end

  def location
    "green|#{NORTHERN_CARAVANSARY}"
  end
end
