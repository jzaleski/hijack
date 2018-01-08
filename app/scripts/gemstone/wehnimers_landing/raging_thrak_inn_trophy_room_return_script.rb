load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/raging_thrak_inn_trophy_room_script.rb", true

class RagingThrakInnTrophyRoomReturnScript < RagingThrakInnTrophyRoomScript
  include ReturnMovementScriptMixin
end
