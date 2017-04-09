load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_bank_script.rb", true

class BankLobbyScript < OutsideBankScript
  protected

  def directions
    [
      "go bank|#{OUT}",
    ]
  end

  def location
    "bank_lobby|#{CROSSING}"
  end
end
