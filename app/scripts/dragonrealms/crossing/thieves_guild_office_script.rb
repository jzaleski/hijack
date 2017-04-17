load "#{SCRIPTS_DIR}/dragonrealms/crossing/thieves_guild_foyer_script.rb", true

class ThievesGuildOfficeScript < ThievesGuildFoyerScript
  protected

  def directions
    super + [
      NORTH,
      'go ebonwood door',
    ]
  end

  def location
    "thieves_guild_office|#{CROSSING}"
  end
end
