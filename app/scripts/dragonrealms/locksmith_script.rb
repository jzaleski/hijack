load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class LocksmithScript < BaseDragonrealmsScript
  AFTER_WIGGLING_THE_MILKY_WHITE_TUBE = 'After wiggling the milky-white tube'
  A_BENT_NEEDLE_STICKS_HARMLESSLY = 'A bent needle sticks harmlessly'
  A_SMALL_BLACK_CRYSTAL_DEEP_IN = 'a small black crystal deep in'
  A_SMALL_GLASS_TUBE_OF_MILKY_WHITE = 'a small glass tube of milky-white'
  A_TINY_BRONZE_FACE_FAE_IN_APPEARANCE = 'A tiny bronze face, Fae in appearance'
  A_TINY_GLASS_TUBE_FILLED_WITH = 'a tiny glass tube filled with'
  CAREFULLY_YOU_PRY_THE_BRONZE_FACE = 'Carefully, you pry the bronze face'
  FAILS_TO_REVEAL_TO_YOU = 'fails to reveal to you'
  FAILS_TO_TEACH_YOU_ANYTHING = 'fails to teach you anything'
  FAR_ENOUGH_AWAY_FROM_THE_LOCK = 'far enough away from the lock'
  FIND_A_MORE_APPROPRIATE_TOOL = 'Find a more appropriate tool'
  HAVE_BEEN_BENT_AWAY_FROM_EACH_OTHER = 'have been bent away from each other'
  HIDDEN_NEXT_TO_THE_KEYHOLE = 'hidden next to the keyhole'
  IF_YOUD_LIKE_TO_DUMP_THE_CONTENTS = "If you'd like to dump the contents"
  INDICATE_THAT_SOMETHING_IS_AWRY = 'indicate that something is awry'
  ITS_NOT_EVEN_LOCKED = "It's not even locked"
  IT_LOOKS_SAFE_ENOUGH = 'It looks safe enough'
  IT_SEEMS_HARMLESS = 'It seems harmless'
  LOOK_DANGEROUSLY_OUT_OF_PLACE = 'look dangerously out of place'
  SEALED_WITH_DIRT_BLOCKING_WHATEVER = 'sealed with dirt, blocking whatever'
  SHOULD_NOT_TAKE_LONG_WITH_YOUR = 'should not take long with your'
  SOMEBODY_HAS_ALREADY_INSPECTED = 'Somebody has already inspected'
  STILL_GRINNING_RIDICULOUSLY = 'Still grinning ridiculously'
  THE_LOCK_HAS_THE_EDGE_ON_YOU = 'The lock has the edge on you'
  THE_ODDS_ARE_AGAINST_YOU = 'The odds are against you'
  THE_SEAL_HAS_BEEN_PRIED_AWAY = 'The seal has been pried away'
  UNABLE_TO_MAKE_ANY_PROGRESS = 'unable to make any progress'
  WHATEVER_IT_WAS_HAS_BEEN_PRIED_OUT = 'whatever it was has been pried out'
  WHILE_CHECKING_THE_BOX_FOR_TRAPS = 'While checking the box for traps'
  WITH_A_SMIRK_YOU_WEDGE_A_SMALL_STICK = 'With a smirk you wedge a small stick'
  WITH_A_SOFT_CLICK = 'With a soft click'
  WITH_ONLY_MINOR_TROUBLES = 'with only minor troubles'
  WITH_SWEAT_FORMING_ON_YOUR_BROW = 'With sweat forming on your brow'
  WORKING_SLOWLY_YOU_CAREFULLY = 'Working slowly, you carefully'
  WOULD_BE_A_LONGSHOT = 'would be a longshot'
  YOU_CAUTIOUSLY_PRY_THE_SEAL_AWAY = 'You cautiously pry the seal away'
  YOU_HAVE_SOME_CHANCE = 'You have some chance'
  YOU_MOVE_YOUR_HANDS_IN_A_PRACTICED = 'You move your hands in a practiced'
  YOU_NOTICE_A_BRONZE_SEAL = 'you notice a bronze seal'
  YOU_NOTICE_A_LUMPY_GREEN_RUNE = 'you notice a lumpy green rune'
  YOU_NUDGE_THE_BLACK_CRYSTAL = 'you nudge the black crystal'
  YOU_REACH_DOWN_AND_SCOOP = 'you reach down and scoop'
  YOU_SEE_A_SHATTERED_GLASS_TUBE = 'You see a shattered glass tube'
  YOU_SEE_WHAT_SEEMS_TO_BE_A_PIN = 'you see what seems to be a pin'
  YOU_SHOVE_THE_PIN_AWAY = 'you shove the pin away'
  YOU_THINK_THIS_LOCK_IS_PRECISELY = 'You think this lock is precisely'
  YOU_WINCE_AS_YOU_FEEL = 'You wince as you feel'

  DISARMED_PATTERN = [
    A_BENT_NEEDLE_STICKS_HARMLESSLY,
    FAR_ENOUGH_AWAY_FROM_THE_LOCK,
    HAVE_BEEN_BENT_AWAY_FROM_EACH_OTHER,
    IT_LOOKS_SAFE_ENOUGH,
    IT_SEEMS_HARMLESS,
    SEALED_WITH_DIRT_BLOCKING_WHATEVER,
    STILL_GRINNING_RIDICULOUSLY,
    THE_SEAL_HAS_BEEN_PRIED_AWAY,
    WHATEVER_IT_WAS_HAS_BEEN_PRIED_OUT,
    YOU_SEE_A_SHATTERED_GLASS_TUBE,
  ].join('|')

  DISARM_IDENTIFY_PATTERN = [
    A_BENT_NEEDLE_STICKS_HARMLESSLY,
    A_SMALL_BLACK_CRYSTAL_DEEP_IN,
    A_SMALL_GLASS_TUBE_OF_MILKY_WHITE,
    A_TINY_BRONZE_FACE_FAE_IN_APPEARANCE,
    A_TINY_GLASS_TUBE_FILLED_WITH,
    FAILS_TO_REVEAL_TO_YOU,
    FAILS_TO_TEACH_YOU_ANYTHING,
    FAR_ENOUGH_AWAY_FROM_THE_LOCK,
    HAVE_BEEN_BENT_AWAY_FROM_EACH_OTHER,
    HIDDEN_NEXT_TO_THE_KEYHOLE,
    INDICATE_THAT_SOMETHING_IS_AWRY,
    IT_LOOKS_SAFE_ENOUGH,
    IT_SEEMS_HARMLESS,
    LOOK_DANGEROUSLY_OUT_OF_PLACE,
    SEALED_WITH_DIRT_BLOCKING_WHATEVER,
    STILL_GRINNING_RIDICULOUSLY,
    THE_SEAL_HAS_BEEN_PRIED_AWAY,
    WHATEVER_IT_WAS_HAS_BEEN_PRIED_OUT,
    WHILE_CHECKING_THE_BOX_FOR_TRAPS,
    YOU_NOTICE_A_BRONZE_SEAL,
    YOU_NOTICE_A_LUMPY_GREEN_RUNE,
    YOU_SEE_A_SHATTERED_GLASS_TUBE,
    YOU_SEE_WHAT_SEEMS_TO_BE_A_PIN,
  ].join('|')

  DISARM_IDENTIFY_SUCCESS_PATTERN = [
    A_SMALL_BLACK_CRYSTAL_DEEP_IN,
    A_SMALL_GLASS_TUBE_OF_MILKY_WHITE,
    A_TINY_BRONZE_FACE_FAE_IN_APPEARANCE,
    A_TINY_GLASS_TUBE_FILLED_WITH,
    HIDDEN_NEXT_TO_THE_KEYHOLE,
    INDICATE_THAT_SOMETHING_IS_AWRY,
    LOOK_DANGEROUSLY_OUT_OF_PLACE,
    WHILE_CHECKING_THE_BOX_FOR_TRAPS,
    YOU_NOTICE_A_BRONZE_SEAL,
    YOU_NOTICE_A_LUMPY_GREEN_RUNE,
    YOU_SEE_WHAT_SEEMS_TO_BE_A_PIN,
  ].join('|')

  DISARM_PATTERN = [
    AFTER_WIGGLING_THE_MILKY_WHITE_TUBE,
    CAREFULLY_YOU_PRY_THE_BRONZE_FACE,
    UNABLE_TO_MAKE_ANY_PROGRESS,
    WITH_A_SMIRK_YOU_WEDGE_A_SMALL_STICK,
    WITH_SWEAT_FORMING_ON_YOUR_BROW,
    WORKING_SLOWLY_YOU_CAREFULLY,
    YOU_CAUTIOUSLY_PRY_THE_SEAL_AWAY,
    YOU_NUDGE_THE_BLACK_CRYSTAL,
    YOU_REACH_DOWN_AND_SCOOP,
    YOU_SHOVE_THE_PIN_AWAY,
  ].join('|')

  DISARM_SUCCESS_PATTERN = [
    AFTER_WIGGLING_THE_MILKY_WHITE_TUBE,
    CAREFULLY_YOU_PRY_THE_BRONZE_FACE,
    WITH_SWEAT_FORMING_ON_YOUR_BROW,
    WITH_A_SMIRK_YOU_WEDGE_A_SMALL_STICK,
    WORKING_SLOWLY_YOU_CAREFULLY,
    YOU_CAUTIOUSLY_PRY_THE_SEAL_AWAY,
    YOU_NUDGE_THE_BLACK_CRYSTAL,
    YOU_REACH_DOWN_AND_SCOOP,
    YOU_SHOVE_THE_PIN_AWAY,
  ].join('|')

  DISMANTLE_PATTERN = [
    IF_YOUD_LIKE_TO_DUMP_THE_CONTENTS,
    YOU_MOVE_YOUR_HANDS_IN_A_PRACTICED,
  ].join('|')

  DISMANTLE_SUCCESS_PATTERN = [
    YOU_MOVE_YOUR_HANDS_IN_A_PRACTICED,
  ].join('|')

  PICKED_PATTERN = [
    ITS_NOT_EVEN_LOCKED,
  ].join('|')

  PICK_IDENTIFY_PATTERN = [
    FAILS_TO_TEACH_YOU_ANYTHING,
    FIND_A_MORE_APPROPRIATE_TOOL,
    ITS_NOT_EVEN_LOCKED,
    SHOULD_NOT_TAKE_LONG_WITH_YOUR,
    SOMEBODY_HAS_ALREADY_INSPECTED,
    THE_LOCK_HAS_THE_EDGE_ON_YOU,
    THE_ODDS_ARE_AGAINST_YOU,
    WITH_ONLY_MINOR_TROUBLES,
    WOULD_BE_A_LONGSHOT,
    YOU_HAVE_SOME_CHANCE,
    YOU_THINK_THIS_LOCK_IS_PRECISELY,
  ].join('|')

  PICK_IDENTIFY_SUCCESS_PATTERN = [
    SHOULD_NOT_TAKE_LONG_WITH_YOUR,
    SOMEBODY_HAS_ALREADY_INSPECTED,
    THE_LOCK_HAS_THE_EDGE_ON_YOU,
    THE_ODDS_ARE_AGAINST_YOU,
    WITH_ONLY_MINOR_TROUBLES,
    WOULD_BE_A_LONGSHOT,
    YOU_HAVE_SOME_CHANCE,
    YOU_THINK_THIS_LOCK_IS_PRECISELY,
  ].join('|')

  PICK_PATTERN = [
    FIND_A_MORE_APPROPRIATE_TOOL,
    UNABLE_TO_MAKE_ANY_PROGRESS,
    WITH_A_SOFT_CLICK,
    YOU_WINCE_AS_YOU_FEEL,
  ].join('|')

  PICK_SUCCESS_PATTERN = [
    WITH_A_SOFT_CLICK,
  ].join('|')

  def run
    container = @args[0] || config_container
    lockpick = @args[1] || config_lockpick
    lockpick_container = @args[2] || config_lockpick_container
    disarm_option = @args[3] || config_disarm_option || 'careful'
    pick_option = @args[4] || config_pick_option || 'careful'
    # ensure that all of the necessary items are accessible
    if open_my(container) && open_my(lockpick_container)
      # try every box type
      BOXES.each do |box|
        # ensure that we have a box to work with
        while get_box(box, container)
          # ensure we have a lockpick to work with, if not, we're done
          return unless get_lockpick(lockpick, lockpick_container)
          # this won't return until it has identified and disarmed the box
          disarm(box, disarm_option)
          # this won't return until it has identified and picked the box
          if pick(box, pick_option)
            # open the box
            open_my(box)
            # need at least one hand free in order to dismantle
            store_my(lockpick, lockpick_container)
            # this will destroy the box, dumping its contents on the ground
            dismantle(box)
          end
        end
      end
    end
    # clean-up
    close_my(lockpick_container)
    close_my(container)
  end

  def validate_args
    @args.length >= 3 || (
      @args.length == 2 &&
      config_lockpick_container.present?
    ) || (
      @args.length == 1 &&
      config_lockpick.present? &&
      config_lockpick_container.present?
    ) || (
      config_container.present? &&
      config_lockpick.present? &&
      config_lockpick_container.present?
    )
  end

  private

  def config_container
    @config[:get_container]
  end

  def config_disarm_option
    @config[:locksmith_disarm_option]
  end

  def config_lockpick
    @config[:locksmith_lockpick]
  end

  def config_lockpick_container
    @config[:locksmith_lockpick_container]
  end

  def config_pick_option
    @config[:locksmith_pick_option]
  end

  def disarm(box, option)
    loop do
      loop do
        result = wait_for_match(
          DISARM_IDENTIFY_PATTERN,
          "disarm my #{box} identify"
        )
        sleep 5.0
        case result
          when DISARMED_PATTERN.to_regexp
            return true
          when DISARM_IDENTIFY_SUCCESS_PATTERN.to_regexp
            break
        end
      end
      loop do
        result = wait_for_match(
          DISARM_PATTERN,
          "disarm my #{box} #{option}".rstrip
        )
        sleep 5.0
        break if result.match(DISARM_SUCCESS_PATTERN)
      end
    end
  end

  def dismantle(box)
    loop do
      result = wait_for_match(
        DISMANTLE_PATTERN,
        "dismantle my #{box}"
      )
      sleep 5.0
      break if result.match(DISMANTLE_SUCCESS_PATTERN)
    end
  end

  def get_box(box, container)
    get_my(box, container) || get_my(box)
  end

  def get_lockpick(lockpick, lockpick_container)
    get_my(lockpick, lockpick_container) || get_my(lockpick)
  end

  def pick(box, option)
    loop do
      loop do
        result = wait_for_match(
          PICK_IDENTIFY_PATTERN,
          "pick my #{box} identify"
        )
        return false if result.match(FIND_A_MORE_APPROPRIATE_TOOL)
        sleep 5.0
        case result
          when PICKED_PATTERN.to_regexp
            return true
          when PICK_IDENTIFY_SUCCESS_PATTERN.to_regexp
            break
        end
      end
      loop do
        result = wait_for_match(
          PICK_PATTERN,
          "pick my #{box} #{option}".rstrip
        )
        return false if result.match(FIND_A_MORE_APPROPRIATE_TOOL)
        sleep 5.0
        break if result.match(PICK_SUCCESS_PATTERN)
      end
    end
  end
end
