load "#{MIXINS_DIR}/gemstone/skinning_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class SkinAndLootAllScript < BaseGemstoneScript
  include SkinningScriptMixin

  def run
    store_my(weapon, sheath) if weapon && sheath
    if open_my(skinning_knife_container) && get_my(skinning_knife)
      loop do
        break unless skin(creature, skinning_knife) && loot
      end
    end
    store_my(skinning_knife, skinning_knife_container)
    close_my(skinning_knife_container)
    get_my(weapon, sheath) if weapon && sheath
  end
end
