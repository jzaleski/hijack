load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_academy_of_agility_script.rb", true

class OutsideTradersGuildScript < OutsideAcademyOfAgilityScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "outside_traders_guild|#{CROSSING}"
  end
end
