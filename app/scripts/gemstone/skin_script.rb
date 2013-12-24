require 'scripts/base/base_gemstone_script'

class SkinScript < BaseGemstoneScript

  YOU_BOTCHED_THE_JOB = 'You botched the job'
  YOU_CAN_ONLY_SKIN_CREATURES = 'You can only skin creatures'
  YOU_SKINNED = 'You skinned'

  SKIN_PATTERN = [
    YOU_BOTCHED_THE_JOB,
    YOU_CAN_ONLY_SKIN_CREATURES,
    YOU_SKINNED,
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
      sleep 0.1 until kneel
      wait_for_match(
        SKIN_PATTERN,
        "skin #{creature} with my #{skinning_knife}"
      )
      sleep 0.1 until stand
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
