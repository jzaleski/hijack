require 'hijack/script/base/base_dragonrealms_script'

class SkinAndLootScript < BaseDragonrealmsScript

  ARRANGE_WHAT = 'Arrange what\?'
  A_SMALL_SLIP = 'A small slip'
  BUNGLE_THE_ATTEMPT = 'bungle the attempt'
  CANNOT_BE_SKINNED = 'cannot be skinned'
  ITS_NOW_A_LOST_CAUSE = "it's now a lost cause"
  JUST_BARELY_PRY = 'just barely pry'
  NEARLY_RUINING_IT = 'nearly ruining it'
  SKIN_WHAT = 'Skin what\?'
  YOU_BEGIN_TO_ARRANGE = 'You begin to arrange'
  YOU_CLAW_WILDLY = 'You claw wildly'
  YOU_CONTINUE_ARRANGING = 'You continue arranging'
  YOU_MAKE_A_SERIES_OF_CUTS = 'You make a series of cuts'
  YOU_PEEL = 'You peel'
  YOU_SKILLFULLY_PEEL = 'You skillfully peel'
  YOU_SKILLFULLY_REMOVE = 'you skillfully remove'
  YOU_SKIN = 'You skin'
  YOU_SLICE_AWAY = 'You slice away'
  YOU_WORK = '[Yy]ou work'

  ARRANGE_FAILURES = [
    ARRANGE_WHAT,
    CANNOT_BE_SKINNED,
  ]

  ARRANGE_PATTERN = [
    ARRANGE_WHAT,
    CANNOT_BE_SKINNED,
    YOU_BEGIN_TO_ARRANGE,
    YOU_CONTINUE_ARRANGING,
  ].join('|')

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

  LOOT_PATTERN = [
    I_COULD_NOT_FIND,
    YOU_SEARCH,
  ].join('|')

  SKIN_PATTERN = [
    A_SMALL_SLIP,
    BUNGLE_THE_ATTEMPT,
    CANNOT_BE_SKINNED,
    ITS_NOW_A_LOST_CAUSE,
    JUST_BARELY_PRY,
    NEARLY_RUINING_IT,
    YOU_CLAW_WILDLY,
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
        break if ARRANGE_FAILURES.include?(match)
        sleep 2
      end
      # skin
      wait_for_match(
        SKIN_PATTERN,
        'skin'
      )
      sleep 2
      # drop the skin
      empty_left
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
