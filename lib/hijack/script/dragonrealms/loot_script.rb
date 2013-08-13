require 'hijack/script/base/base_dragonrealms_script'

class LootScript < BaseDragonrealmsScript

  LOOK_FAILURES = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
  ]

  LOOK_PATTERN = [
    DEAD,
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
    WHICH_APPEARS_DEAD,
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
      # loot the creature
      loot(loot_type)
      # wait a few additional seconds on loot-success before returning to the
      # main loop (give the creature some time to decay)
      sleep 5
    end
  end

  private

  def config_loot_type
    @config[:loot_type]
  end

end
