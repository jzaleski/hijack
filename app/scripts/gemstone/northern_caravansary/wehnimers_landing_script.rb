load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/northern_caravansary_script.rb", true

class WehnimersLandingScript < NorthernCaravansaryScript
  include ReturnMovementScriptMixin

  protected

  def location
    "town_square_central|#{WEHNIMERS_LANDING}"
  end
end
