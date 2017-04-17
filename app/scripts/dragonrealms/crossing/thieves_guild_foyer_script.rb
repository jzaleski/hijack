load "#{SCRIPTS_DIR}/dragonrealms/crossing/sand_spit_tavern_barroom_script.rb", true

class ThievesGuildFoyerScript < SandSpitTavernBarroomScript
  protected

  def directions
    super + [
      'go area|go bar',
      'climb ladder',
      'go other barrel|go hole',
      EAST,
      'go space|go niche',
      SOUTH,
    ]
  end

  def location
    "thieves_guild_foyer|#{CROSSING}"
  end
end
