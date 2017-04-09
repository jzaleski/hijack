load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/town_hall_lobby_script.rb", true

class TownHallLobbyReturnScript < TownHallLobbyScript
  include ReturnMovementScriptMixin
end
