require 'hijack/script/base/base_dragonrealms_script'

class LootScript < BaseDragonrealmsScript

  DEAD_LONG = 'which appears dead'
  DEAD_SHORT = '\(dead\)'
  LOOT_SUCCESS = 'You search'
  NO_CORPSE = 'I could not find'
  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'

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

  def run(args)
    loot_type = args[0] || config_loot_type || 'goods'
    loop do
      match = wait_for_match(
        LOOK_PATTERN,
        'look'
      )
      # if there isn't anything to loot wait a bit and then try again
      if LOOK_FAILURES.include?(match)
        sleep 15
        next
      end
      wait_for_match(
        LOOT_PATTERN,
        "loot #{loot_type}"
      )
      # wait a few additional seconds on loot-success before returning to the
      # main loop (give the creature some time to decay)
      sleep 3
    end
  end

  private

  def config_loot_type
    @config[:loot_type]
  end

end
