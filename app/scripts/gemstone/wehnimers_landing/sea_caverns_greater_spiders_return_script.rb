load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_caverns_greater_spiders_script.rb", true

class SeaCavernsGreaterSpidersReturnScript < SeaCavernsGreaterSpidersScript
  include ReturnMovementScriptMixin
end
