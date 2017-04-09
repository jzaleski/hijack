load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_lobby_script.rb", true

class BankLobbyReturnScript < BankLobbyScript
  include ReturnMovementScriptMixin
end
