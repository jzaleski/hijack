load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_bards_guild_script.rb", true

class OutsideAcademyOfAgilityScript < OutsideBardsGuildScript
  protected

  def directions
    super + [
      WEST,
      "go bridge|#{WEST}",
      WEST,
      SOUTH,
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "outside_academy_of_agility|#{CROSSING}"
  end
end
