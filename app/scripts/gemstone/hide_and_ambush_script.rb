load "#{MIXINS_DIR}/gemstone/ambushing_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class HideAndAmbushScript < BaseGemstoneScript
  include AmbushingScriptMixin

  def run
    sleep 0.1 until hide
    stance_offensive
    unhide unless ambush(creature, aim_at)
    stance_defensive
  end
end
