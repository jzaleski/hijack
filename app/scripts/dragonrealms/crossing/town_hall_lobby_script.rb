load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_town_hall_script.rb", true

class TownHallLobbyScript < OutsideTownHallScript
  protected

  def directions
    super + [
      "go town hall|#{OUT}",
    ]
  end

  def location
    "town_hall_lobby|#{CROSSING}"
  end
end
