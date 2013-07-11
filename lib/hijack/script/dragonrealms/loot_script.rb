require 'hijack/script/base/base_dragonrealms_script'

class LootScript < BaseDragonrealmsScript

  DEAD_LONG = 'which appears dead'
  DEAD_SHORT = '\(dead\)'
  IN_ROUNDTIME = '...wait'
  LOOT_SUCCESS = 'You search'
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
    IN_ROUNDTIME,
    LOOT_SUCCESS,
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
      loop do
        match = wait_for_match(
          LOOT_PATTERN,
          "loot #{loot_type}"
        )
        # wait a few additional seconds on loot-success before returning to the
        # main loop (give the creature some time to decay)
        if match == LOOT_SUCCESS
          sleep 3
          break
        end
        # in round-time, wait one second between attempts
        sleep 1
      end
    end
  end

  private

  def config_loot_type
    @config[:loot_type]
  end

end
