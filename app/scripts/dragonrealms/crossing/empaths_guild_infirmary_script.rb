load "#{SCRIPTS_DIR}/dragonrealms/crossing/empaths_guild_courtyard_garden_script.rb", true

class EmpathsGuildInfirmaryScript < EmpathsGuildCourtyardGardenScript
  protected

  def directions
    super + [
      WEST,
    ]
  end

  def location
    "empaths_guild_infirmary|#{CROSSING}"
  end
end
