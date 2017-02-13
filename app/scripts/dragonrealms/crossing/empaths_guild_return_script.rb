load "#{SCRIPTS_DIR}/dragonrealms/crossing/empaths_guild_script.rb", true

class EmpathsGuildReturnScript < EmpathsGuildScript
  protected

  def directions
    reverse_directions(super)
  end
end
