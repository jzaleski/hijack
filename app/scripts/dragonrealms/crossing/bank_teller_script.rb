load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_lobby_script.rb", true

class BankTellerScript < BankLobbyScript
  protected

  def directions
    super + [
      "go window|#{OUT}",
    ]
  end

  def location
    "bank_teller|#{CROSSING}"
  end
end
