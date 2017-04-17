load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_barbarians_guild_script.rb", true

class OutsideEmpathsGuildScript < OutsideBarbariansGuildScript
  protected

  def directions
    super + [
      NORTH,
    ]
  end

  def location
    "outside_empaths_guild|#{CROSSING}"
  end
end
