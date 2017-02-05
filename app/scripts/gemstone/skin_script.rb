load "#{MIXINS_DIR}/gemstone/skinning_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class SkinScript < BaseGemstoneScript
  include SkinningScriptMixin

  def run
    store_my(weapon, sheath) if config_store_weapon && weapon && sheath
    if open_my(skinning_knife_container) && get_my(skinning_knife)
      sleep 0.1 until kneel
      sleep 0.1 until stance_offensive
      skin(creature, skinning_knife)
      sleep 0.1 until stance_defensive
      sleep 0.1 until stand
    end
    store_my(skinning_knife, skinning_knife_container)
    close_my(skinning_knife_container)
    get_my(weapon, sheath) if config_store_weapon && weapon && sheath
  end
end
