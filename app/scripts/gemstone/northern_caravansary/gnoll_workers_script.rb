load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/stockade_gate_script.rb", true

class GnollWorkersScript < StockadeGateScript
  protected

  def directions
    super + [
      NORTH,
      NORTH,
    ]
  end

  def location
    "gnoll_workers|#{NORTHERN_CARAVANSARY}"
  end
end
