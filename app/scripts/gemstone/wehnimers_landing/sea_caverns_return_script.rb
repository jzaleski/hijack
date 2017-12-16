load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_caverns_script.rb", true

class SeaCavernsReturnScript < SeaCavernsScript
  include ReturnMovementScriptMixin
end
