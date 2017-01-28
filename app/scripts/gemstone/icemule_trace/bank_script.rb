load "#{APP_DIR}/scripts/gemstone/icemule_trace/town_center_script.rb", true

class BankScript < TownCenterScript
  protected

  def directions
    [
      EAST,
      "go bank|#{OUT}",
    ]
  end

  def location
    "bank|#{ICEMULE_TRACE}"
  end
end
