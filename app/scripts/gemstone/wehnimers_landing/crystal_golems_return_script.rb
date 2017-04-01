load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/crystal_golems_script.rb", true

class CrystalGolemsReturnScript < CrystalGolemsScript
  include ReturnMovementScriptMixin
end
