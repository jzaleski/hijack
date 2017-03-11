load "#{MIXINS_DIR}/gemstone/ambushing_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class AmbushScript < BaseGemstoneScript
  include AmbushingScriptMixin

  def run
    stance_offensive
    ambush(creature, aim_at)
    stance_defensive
  end
end
