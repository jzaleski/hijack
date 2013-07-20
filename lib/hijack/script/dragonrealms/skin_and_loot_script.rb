require 'hijack/script/base/base_dragonrealms_script'

class SkinAndLootScript < BaseDragonrealmsScript

  DEAD_LONG = 'which appears dead'
  DEAD_SHORT = '\(dead\)'
  LOOT_SUCCESS = 'You search'
  NO_CORPSE = 'I could not find'
  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'
  SKIN_WHAT = 'Skin what\?'

  LOOK_FAILURES = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
  ]

  LOOK_PATTERN = [
    DEAD_LONG,
    DEAD_SHORT,
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
  ].join('|')

  LOOT_PATTERN = [
    LOOT_SUCCESS,
    NO_CORPSE,
  ].join('|')

  def validate_args(args)
    args.length >= 1 || config_skin_type
  end

  def run(args)
    skin_type = args[0] || config_skin_type
    loot_type = args[1] || config_loot_type || 'goods'
    loop do
      # anything to skin & loot?
      match = wait_for_match(
        LOOK_PATTERN,
        'look'
      )
      # if there isn't anything to loot wait a bit and then try again
      if LOOK_FAILURES.include?(match)
        sleep 15
        next
      end
      # skin
      wait_for_match(
        "#{skin_type} from|#{NO_CORPSE}|#{SKIN_WHAT}",
        'skin'
      )
      # wait a few seconds before attempting to drop the skin
      sleep 3
      # drop the skin
      wait_for_match(
        'You drop',
        "drop #{skin_type}"
      )
      # loot the creature
      wait_for_match(
        LOOT_PATTERN,
        "loot #{loot_type}"
      )
      # wait a few additional seconds on loot-success before returning to the
      # main loop (give the creature some time to decay)
      sleep 5
    end
  end

  private

  def config_skin_type
    @config[:skin_type]
  end

  def config_loot_type
    @config[:loot_type]
  end

end
