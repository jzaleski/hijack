load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class AdventurersGuildScript < TownCenterScript
  protected

  def directions
    super + [
      EAST,
      EAST,
      "go guild|#{OUT}",
    ]
  end

  def location
    "adventurers_guild|#{ICEMULE_TRACE}"
  end
end
