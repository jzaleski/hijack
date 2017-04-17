load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_barbarians_guild_script.rb", true

class StaminaScript < OutsideBarbariansGuildScript
  protected

  def directions
    super + [
      "go structure|#{OUT}",
    ]
  end

  def location
    "stamina|#{CROSSING}"
  end
end
