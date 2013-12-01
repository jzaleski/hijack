require 'scripts/base/base_gemstone_script'

class SkinAndLootScript < BaseGemstoneScript

  COULD_NOT_FIND_A_VALID_TARGET = 'Could not find a valid target'
  YOU_BOTCHED_THE_JOB = 'You botched the job'
  YOU_CAN_ONLY_SKIN_CREATURES = 'You can only skin creatures'
  YOU_SEARCH_THE = 'You search the'
  YOU_SKINNED = 'You skinned'

  SKIN_PATTERN = [
    YOU_BOTCHED_THE_JOB,
    YOU_CAN_ONLY_SKIN_CREATURES,
    YOU_SKINNED,
  ].join('|')

  LOOT_PATTERN = [
    COULD_NOT_FIND_A_VALID_TARGET,
    YOU_SEARCH_THE,
  ].join('|')

  def validate_args(args)
    args.length == 3 ||
    (args.length == 2 && config_skinning_knife_container) ||
    (args.length == 1 && config_skinning_knife && config_skinning_knife_container) ||
    (config_creature && config_skinning_knife && config_skinning_knife_container)
  end

  def run(args)
    creature = args[0] || config_creature
    skinning_knife = args[1] || config_skinning_knife
    skinning_knife_container = args[2] || config_skinning_knife_container
    if open_my(skinning_knife_container) && get_my(skinning_knife)
      wait_for_match(
        SKIN_PATTERN,
        "skin #{creature}"
      )
      wait_for_match(
        LOOT_PATTERN,
        'loot'
      )
    end
    store_my(skinning_knife, skinning_knife_container)
    close_my(skinning_knife_container)
  end

  private

  def config_creature
    @config[:skin_creature]
  end

  def config_skinning_knife
    @config[:skin_skinning_knife]
  end

  def config_skinning_knife_container
    @config[:skin_skinning_knife_container]
  end

end
