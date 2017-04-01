load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/mother_magpies_script.rb", true

class MotherMagpiesReturnScript < MotherMagpiesScript
  include ReturnMovementScriptMixin
end
