load "#{SCRIPTS_DIR}/dragonrealms/crossing/town_hall_lobby_script.rb", true

class TownHallDebtorsOfficeScript < TownHallLobbyScript
  protected

  def directions
    super + [
      "go collection office|#{OUT}",
    ]
  end

  def location
    "town_hall_debtors_office|#{CROSSING}"
  end
end
