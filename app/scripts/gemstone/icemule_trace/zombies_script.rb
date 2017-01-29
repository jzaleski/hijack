load "#{SCRIPTS_DIR}/gemstone/icemule_trace/abandoned_farm_script.rb", true

class ZombiesScript < AbandonedFarmScript
  protected

  def directions
    super + [
      "go door|#{OUT}",
    ]
  end

  def location
    "zombies|#{ICEMULE_TRACE}"
  end
end
