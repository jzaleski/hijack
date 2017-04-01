load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/town_green_script.rb", true

class TownGreenReturnScript < TownGreenScript
  include ReturnMovementScriptMixin
end
