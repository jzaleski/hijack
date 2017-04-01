load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/carousel_script.rb", true

class CarouselReturnScript < CarouselScript
  include ReturnMovementScriptMixin
end
