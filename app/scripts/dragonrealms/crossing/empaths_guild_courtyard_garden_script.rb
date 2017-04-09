load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_empaths_guild_script.rb", true

class EmpathsGuildCourtyardGardenScript < OutsideEmpathsGuildScript
  protected

  def directions
    super + [
      "go door|#{OUT}",
    ]
  end

  def location
    "empaths_guild_courtyard_garden|#{CROSSING}"
  end
end
