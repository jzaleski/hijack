require 'hijack/script/base/base_dragonrealms_script'

class SkinAndLootScript < BaseDragonrealmsScript

  A_SMALL_SLIP = 'A small slip'
  ARRANGE_WHAT = 'Arrange what\?'
  DEAD_LONG = 'which appears dead'
  DEAD_SHORT = '\(dead\)'
  ITS_NOW_A_LOST_CAUSE = "it's now a lost cause"
  LOOT_SUCCESS = 'You search'
  NEARLY_RUINING_IT = 'nearly ruining it'
  NO_CORPSE = 'I could not find'
  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'
  SKIN_WHAT = 'Skin what\?'
  WHAT_WERE_YOU = 'What were you'
  YOUR_LEFT_HAND_IS_ALREADY_EMPTY = 'Your left hand is already empty'
  YOU_BEGIN_TO_ARRANGE = 'You begin to arrange'
  YOU_CONTINUE_ARRANGING = 'You continue arranging'
  YOU_DROP = 'You drop'
  YOU_MAKE_A_SERIES_OF_CUTS = 'You make a series of cuts'
  YOU_PEEL = 'You peel'
  YOU_SKILLFULLY_PEEL = 'You skillfully peel'
  YOU_SKILLFULLY_REMOVE = 'you skillfully remove'
  YOU_SKIN = 'You skin'
  YOU_SLICE_AWAY = 'You slice away'
  YOU_WORK = '[Yy]ou work'

  ARRANGE_PATTERN = [
    ARRANGE_WHAT,
    YOU_BEGIN_TO_ARRANGE,
    YOU_CONTINUE_ARRANGING,
  ].join('|')

  DROP_PATTERN = [
    WHAT_WERE_YOU,
    YOU_DROP,
    YOUR_LEFT_HAND_IS_ALREADY_EMPTY,
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
    NEARLY_RUINING_IT,
    YOU_MAKE_A_SERIES_OF_CUTS,
    YOU_PEEL,
    YOU_SKILLFULLY_PEEL,
    YOU_SKILLFULLY_REMOVE,
    YOU_SKIN,
    YOU_SLICE_AWAY,
    YOU_WORK,
  ].join('|')

  def run(args)
    num_arranges = [0, (args[0] || config_num_arranges).to_i].max
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
      # arrange
      num_arranges.times do |i|
        match = wait_for_match(
          ARRANGE_PATTERN,
          'arrange'
        )
        break if match == ARRANGE_WHAT
        sleep 2
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

  def config_loot_type
    @config[:loot_type]
  end

  def config_num_arranges
    @config[:skin_num_arranges]
  end

end
