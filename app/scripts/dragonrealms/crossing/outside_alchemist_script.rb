load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_empaths_guild_script.rb", true

class OutsideAlchemistScript < OutsideEmpathsGuildScript
  protected

  def directions
    super + [
      WEST,
      NORTH,
      WEST,
    ]
  end

  def location
    "outside_alchemist|#{CROSSING}"
  end
end
