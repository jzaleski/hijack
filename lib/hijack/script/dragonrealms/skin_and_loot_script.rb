require 'hijack/script/base/base_dragonrealms_script'

class SkinAndLootScript < BaseDragonrealmsScript

  A_SMALL_SLIP = 'A small slip'
  DEAD_LONG = 'which appears dead'
  DEAD_SHORT = '\(dead\)'
  ITS_NOW_A_LOST_CAUSE = "it's now a lost cause"
  LOOT_SUCCESS = 'You search'
  NO_CORPSE = 'I could not find'
  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'
  SKIN_WHAT = 'Skin what\?'
  WHAT_WERE_YOU = 'What were you'
  YOU_DROP = 'You drop'
  YOU_PEEL = 'You peel'
  YOU_SKILLFULLY_REMOVE = 'you skillfully remove'
  YOU_SLICE_AWAY = 'You slice away'
  YOU_WORK_HARD = 'You work hard'
  YOU_WORK_LOOSE = 'you work loose'

  DROP_PATTERN = [
    WHAT_WERE_YOU,
    YOU_DROP,
  ].join('|')

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

  SKIN_PATTERN = [
    A_SMALL_SLIP,
    ITS_NOW_A_LOST_CAUSE,
    YOU_PEEL,
    YOU_SKILLFULLY_REMOVE,
    YOU_SLICE_AWAY,
    YOU_WORK_HARD,
    YOU_WORK_LOOSE,
  ].join('|')

  def validate_args(args)
    args.length >= 1 ||
    config_skin_type
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
        SKIN_PATTERN,
        'skin'
      )
      # wait a few seconds before attempting to drop the skin
      sleep 3
      # drop the skin
      wait_for_match(
        DROP_PATTERN,
        'empty left'
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
