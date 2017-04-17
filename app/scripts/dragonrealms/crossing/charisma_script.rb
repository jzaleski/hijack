load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_traders_guild_script.rb", true

class CharismaScript < OutsideTradersGuildScript
  protected

  def directions
    super + [
      EAST,
      "go cottage|#{OUT}",
    ]
  end

  def location
    "charisma|#{CROSSING}"
  end
end
