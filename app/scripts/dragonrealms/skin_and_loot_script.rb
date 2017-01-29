load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class SkinAndLootScript < BaseDragonrealmsScript
  ARRANGE_WHAT = 'Arrange what\?'
  A_SMALL_SLIP = 'A small slip'
  BUNGLE_THE_ATTEMPT = 'bungle the attempt'
  CANNOT_BE_SKINNED = 'cannot be skinned'
  ITS_NOW_A_LOST_CAUSE = "it's now a lost cause"
  JUST_BARELY_PRY = 'just barely pry'
  NEARLY_RUINING_IT = 'nearly ruining it'
  SKIN_WHAT = 'Skin what\?'
  THAT_HAS_ALREADY_BEEN_ARRANGED = 'That has already been arranged'
  YOU_BEGIN_TO_ARRANGE = 'You begin to arrange'
  YOU_CLAW_WILDLY = 'You claw wildly'
  YOU_COMPLETE_ARRANGING = 'You complete arranging'
  YOU_CONTINUE_ARRANGING = 'You continue arranging'
  YOU_MAKE_A_SERIES_OF_CUTS = 'You make a series of cuts'
  YOU_MUST_HAVE_ONE_HAND_FREE = 'You must have one hand free'
  YOU_PEEL = 'You peel'
  YOU_SKILLFULLY_PEEL = 'You skillfully peel'
  YOU_SKILLFULLY_REMOVE = 'you skillfully remove'
  YOU_SKIN = 'You skin'
  YOU_SLICE_AWAY = 'You slice away'
  YOU_WORK = '[Yy]ou work'

  ARRANGE_PATTERN = [
    ARRANGE_WHAT,
    CANNOT_BE_SKINNED,
    THAT_HAS_ALREADY_BEEN_ARRANGED,
    YOU_BEGIN_TO_ARRANGE,
    YOU_COMPLETE_ARRANGING,
    YOU_CONTINUE_ARRANGING,
  ].join('|')

  ARRANGE_SUCCESS_PATTERN = [
    YOU_BEGIN_TO_ARRANGE,
    YOU_COMPLETE_ARRANGING,
    YOU_CONTINUE_ARRANGING,
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
    YOU_MUST_HAVE_ONE_HAND_FREE,
    YOU_PEEL,
    YOU_SKILLFULLY_PEEL,
    YOU_SKILLFULLY_REMOVE,
    YOU_SKIN,
    YOU_SLICE_AWAY,
    YOU_WORK,
  ].join('|')

  def run
    num_arranges = [0, (@args[0] || config_num_arranges).to_i].max
    loot_type = @args[1] || config_loot_type || 'goods'
    loop do
      # any dead creatures?
      unless dead_creature?
        sleep 15.0
        next
      end
      # arrange
      num_arranges.times do |i|
        result = wait_for_match(
          ARRANGE_PATTERN,
          'arrange'
        )
        break unless result.match(ARRANGE_SUCCESS_PATTERN)
        sleep 2.0
      end
      # skin
      wait_for_match(
        SKIN_PATTERN,
        'skin'
      )
      sleep 2.0
      # drop the skin
      empty_left
      # loot the creature
      loot(loot_type)
      # wait a few additional seconds on loot-success before returning to the
      # main loop (give the creature some time to decay)
      sleep 5.0
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
