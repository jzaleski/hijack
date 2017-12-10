load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/gnoll_workers_script.rb", true

class StockadeGateScript < GnollWorkersScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "stockade_gate|#{WEHNIMERS_LANDING}"
  end
end
