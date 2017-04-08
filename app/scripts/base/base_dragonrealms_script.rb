load "#{SCRIPTS_DIR}/base/base_simutronics_script.rb", true

class BaseDragonrealmsScript < BaseSimutronicsScript
  ALREADY_HIDDEN = 'already hidden'
  ARE_UNABLE_TO_GET_AWAY = 'are unable to get away'
  AS_FAR_AWAY_AS_YOU_CAN_GET = 'as far away as you can get'
  ATTEMPTING_TO_AVOID_THE_NOTICE = 'attempting to avoid the notice'
  ATTEMPT_TO_CHANNEL = 'attempt to channel'
  BUT_YOU_ARENT_HOLDING_THAT = "But you aren't holding that"
  CANNOT_MANAGE_TO_STAND = 'cannot manage to stand'
  CROSSING = 'crossing'
  DEAD = '\(dead\)'
  FORGE_A_MAGICAL_LINK = 'forge a magical link'
  FROM_YOUR_HANDS = 'from your hands'
  INVOKE_WHAT = 'Invoke what\?'
  IS_INTACT = 'is intact\.'
  I_COULD_NOT_FIND = 'I could not find'
  MOVING_STEALTHY_YOU_MANAGE = 'Moving stealthily, you manage'
  NO_IDEA_HOW = 'no idea how'
  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'
  ONTO_YOUR_HANDS = 'onto your hands'
  RATHA = 'ratha'
  REMOVE_WHAT = 'Remove what\?'
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already'
  THEN_HANDS_YOU = 'then hands you'
  THERE_IS_NOTHING_ELSE = 'There is nothing else'
  THERE_IS_NO_MERCHANT = 'There is no merchant'
  TRIES_TO_FIND = 'tries to find'
  WEAR_WHAT = 'Wear what\?'
  WHAT_WERE_YOU = 'What were you'
  WHAT_WERE_YOU_REFERRING_TO = 'What were you referring to\?'
  WHICH_APPEARS_DEAD = 'which appears dead'
  YOUR_LEFT_HAND_IS_ALREADY_EMPTY = 'Your left hand is already empty'
  YOUR_PATTERN_DISSIPATES = 'Your pattern dissipates'
  YOUR_RIGHT_HAND_IS_ALREADY_EMPTY = 'Your right hand is already empty'
  YOUR_TARGET_PATTERN_DISSIPATES = 'Your target pattern dissipates'
  YOUR_TARGET_PATTERN_IS = 'Your target pattern is'
  YOU_ARENT_PREPARING = "You aren't preparing"
  YOU_ARENT_WEARING_THAT = "You aren't wearing that"
  YOU_ARE_ALREADY = 'You are already'
  YOU_ARE_ALREADY_KNEELING = 'You are already kneeling'
  YOU_ARE_ALREADY_LYING = 'You are already lying'
  YOU_ARE_ALREADY_PREPARING = 'You are already preparing'
  YOU_ARE_ALREADY_SITTING = 'You are already sitting'
  YOU_ARE_ALREADY_STANDING = 'You are already standing'
  YOU_ARE_NOT_HIDDEN = 'you are not hidden'
  YOU_ARE_UNABLE_TO_FOCUS_ENOUGH_LIGHT = 'You are unable to focus enough light'
  YOU_ATTACH_A = 'You attach a'
  YOU_ATTACH_SOME = 'You attach some'
  YOU_BEGIN_TO_WEAVE = 'You begin to weave'
  YOU_BLEND_IN = 'You blend in'
  YOU_CANT_CLOSE = "You can't close"
  YOU_CANT_DO = "You can't do"
  YOU_CANT_GO_THERE = "You can't go there"
  YOU_CANT_OPEN = "You can't open"
  YOU_CANT_SNEAK = "You can't sneak"
  YOU_CANT_STEAL_THAT = "You can't steal that"
  YOU_CLOSE = 'You close'
  YOU_COME_OUT = 'You come out'
  YOU_DETACH_A = 'You detach a'
  YOU_DONT_HAVE_A_SPELL = "You don't have a spell"
  YOU_DROP = 'You drop'
  YOU_GESTURE = 'You gesture'
  YOU_GET = 'You get'
  YOU_HAVE_ALREADY_FULLY = 'You have already fully'
  YOU_KNEEL = 'You kneel'
  YOU_LET_YOUR_CONCENTRATION_LAPSE = 'You let your concentration lapse'
  YOU_LIE = 'You lie'
  YOU_LOOSEN_THE_STRAPS = 'You loosen the straps'
  YOU_MELT_INTO = 'You melt into'
  YOU_MUST_BE_PREPARING_A_SPELL = 'You must be preparing a spell'
  YOU_NEED_AT_LEAST_ONE_HAND_FREE = 'You need at least one hand free'
  YOU_NEED_A_FREE_HAND = 'You need a free hand'
  YOU_OPEN_THE = 'You open the'
  YOU_OPEN_YOUR = 'You open your'
  YOU_PICK_UP = 'You pick up'
  YOU_PUT_A = 'You put a'
  YOU_PUT_YOUR = 'You put your'
  YOU_RAISE_AN = 'You raise an'
  YOU_REMOVE_A = 'You remove a'
  YOU_REMOVE_SOME = 'You remove some'
  YOU_RETREAT = 'You retreat'
  YOU_RISE_TO_A_KNEELING_POSITION = 'You rise to a kneeling position'
  YOU_SEARCH = 'You search'
  YOU_SIT = 'You sit'
  YOU_SLIDE_YOUR = 'You slide your'
  YOU_SLING_A = 'You sling a'
  YOU_SNEAK = 'You sneak'
  YOU_STAND = 'You stand'
  YOU_TAKE_A = 'You take a'
  YOU_TRY_TO_BACK_AWAY = 'You try to back away'
  YOU_TRY_TO_MOVE_BUT_YOURE_ENGAGED = "You try to move, but you're engaged"
  YOU_WORK_YOUR_WAY = 'You work your way'

  BOXES = %w[
    box
    caddy
    casket
    chest
    coffer
    crate
    skippet
    strongbox
    trunk
  ]

  CAST_PATTERN = [
    YOUR_TARGET_PATTERN_DISSIPATES,
    YOU_ARE_UNABLE_TO_FOCUS_ENOUGH_LIGHT,
    YOU_DONT_HAVE_A_SPELL,
    YOU_GESTURE,
  ].join('|')

  CAST_SUCCESS_PATTERN = [
    YOU_GESTURE,
  ].join('|')

  CHARGE_MY_PATTERN = [
    ATTEMPT_TO_CHANNEL,
    I_COULD_NOT_FIND,
  ].join('|')

  CHARGE_MY_SUCCESS_PATTERN = [
    ATTEMPT_TO_CHANNEL,
  ].join('|')

  CLOSE_MY_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    WHAT_WERE_YOU,
    YOU_CANT_CLOSE,
    YOU_CLOSE,
  ].join('|')

  CLOSE_MY_SUCCESS_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    YOU_CLOSE,
  ].join('|')

  DEAD_CREATURE_PATTERN = [
    DEAD,
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
    WHICH_APPEARS_DEAD,
  ].join('|')

  DEAD_CREATURE_SUCCESS_PATTERN = [
    DEAD,
    WHICH_APPEARS_DEAD,
  ].join('|')

  DROP_MY_PATTERN = [
    BUT_YOU_ARENT_HOLDING_THAT,
    WHAT_WERE_YOU,
    YOU_DROP,
  ].join('|')

  DROP_MY_SUCCESS_PATTERN = [
    YOU_DROP,
  ].join('|')

  EMPTY_LEFT_PATTERN = [
    YOUR_LEFT_HAND_IS_ALREADY_EMPTY,
    YOU_DROP,
  ].join('|')

  EMPTY_LEFT_SUCCESS_PATTERN = [
    YOUR_LEFT_HAND_IS_ALREADY_EMPTY,
    YOU_DROP,
  ].join('|')

  EMPTY_RIGHT_PATTERN = [
    YOUR_RIGHT_HAND_IS_ALREADY_EMPTY,
    YOU_DROP,
  ].join('|')

  EMPTY_RIGHT_SUCCESS_PATTERN = [
    YOUR_RIGHT_HAND_IS_ALREADY_EMPTY,
    YOU_DROP,
  ].join('|')

  GET_PATTERN = [
    WHAT_WERE_YOU,
    YOU_ARE_ALREADY,
    YOU_CANT_DO,
    YOU_GET,
    YOU_NEED_A_FREE_HAND,
    YOU_PICK_UP,
  ].join('|')

  GET_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY,
    YOU_GET,
    YOU_PICK_UP,
  ].join('|')

  GET_MY_PATTERN = [
    WHAT_WERE_YOU,
    YOU_ARE_ALREADY,
    YOU_GET,
    YOU_NEED_A_FREE_HAND,
  ].join('|')

  GET_MY_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY,
    YOU_GET,
  ].join('|')

  HIDE_PATTERN = [
    ALREADY_HIDDEN,
    YOU_MELT_INTO,
    YOU_BLEND_IN,
  ].join('|')

  HIDE_SUCCESS_PATTERN = [
    YOU_MELT_INTO,
    YOU_BLEND_IN,
  ].join('|')

  INVOKE_MY_PATTERN = [
    FORGE_A_MAGICAL_LINK,
    INVOKE_WHAT,
    IS_INTACT,
  ].join('|')

  INVOKE_MY_SUCCESS_PATTERN = [
    FORGE_A_MAGICAL_LINK,
    IS_INTACT,
  ].join('|')

  KNEEL_PATTERN = [
    YOU_ARE_ALREADY_KNEELING,
    YOU_KNEEL,
    YOU_RISE_TO_A_KNEELING_POSITION,
  ].join('|')

  KNEEL_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_KNEELING,
    YOU_KNEEL,
    YOU_RISE_TO_A_KNEELING_POSITION,
  ].join('|')

  LIE_PATTERN = [
    YOU_ARE_ALREADY_LYING,
    YOU_LIE,
  ].join('|')

  LIE_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_LYING,
    YOU_LIE,
  ].join('|')

  LOOK_PATTERN = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
  ].join('|')

  LOOK_SUCCESS_PATTERN = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
  ].join('|')

  LOOT_PATTERN = [
    I_COULD_NOT_FIND,
    YOU_SEARCH,
  ].join('|')

  LOOT_SUCCESS_PATTERN = [
    YOU_SEARCH,
  ].join('|')

  MOVE_PATTERN = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_CANT_GO_THERE,
    YOU_TRY_TO_MOVE_BUT_YOURE_ENGAGED,
  ].join('|')

  OPEN_MY_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    WHAT_WERE_YOU,
    YOU_CANT_OPEN,
    YOU_OPEN_THE,
    YOU_OPEN_YOUR,
  ].join('|')

  OPEN_MY_SUCCESS_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    YOU_OPEN_THE,
    YOU_OPEN_YOUR,
  ].join('|')

  PREP_PATTERN = [
    NO_IDEA_HOW,
    YOU_ARE_ALREADY_PREPARING,
    YOU_HAVE_ALREADY_FULLY,
    YOU_RAISE_AN,
  ].join('|')

  PREP_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_PREPARING,
    YOU_HAVE_ALREADY_FULLY,
    YOU_RAISE_AN,
  ].join('|')

  RELEASE_PATTERN = [
    YOU_ARENT_PREPARING,
    YOU_LET_YOUR_CONCENTRATION_LAPSE,
  ].join('|')

  RELEASE_SUCCESS_PATTERN = [
    YOU_ARENT_PREPARING,
    YOU_LET_YOUR_CONCENTRATION_LAPSE,
  ].join('|')

  REMOVE_MY_PATTERN = [
    FROM_YOUR_HANDS,
    REMOVE_WHAT,
    YOU_ARENT_WEARING_THAT,
    YOU_DETACH_A,
    YOU_LOOSEN_THE_STRAPS,
    YOU_REMOVE_A,
    YOU_REMOVE_SOME,
    YOU_SLING_A,
    YOU_TAKE_A,
    YOU_WORK_YOUR_WAY,
  ].join('|')

  REMOVE_MY_SUCCESS_PATTERN = [
    FROM_YOUR_HANDS,
    YOU_ARENT_WEARING_THAT,
    YOU_DETACH_A,
    YOU_LOOSEN_THE_STRAPS,
    YOU_REMOVE_A,
    YOU_REMOVE_SOME,
    YOU_SLING_A,
    YOU_TAKE_A,
    YOU_WORK_YOUR_WAY,
  ].join('|')

  RETREAT_PATTERN = [
    ARE_UNABLE_TO_GET_AWAY,
    AS_FAR_AWAY_AS_YOU_CAN_GET,
    YOU_TRY_TO_BACK_AWAY,
    YOU_RETREAT,
  ].join('|')

  RETREAT_SUCCESS_PATTERN = [
    AS_FAR_AWAY_AS_YOU_CAN_GET,
    YOU_RETREAT,
  ].join('|')

  SELL_MY_PATTERN = [
    I_COULD_NOT_FIND,
    THEN_HANDS_YOU,
    THERE_IS_NO_MERCHANT,
    TRIES_TO_FIND,
  ].join('|')

  SELL_MY_SUCCESS_PATTERN = [
    THEN_HANDS_YOU,
  ].join('|')

  SIT_PATTERN = [
    YOU_ARE_ALREADY_SITTING,
    YOU_SIT,
  ].join('|')

  SIT_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_SITTING,
    YOU_SIT,
  ].join('|')

  SNEAK_PATTERN = [
    YOU_CANT_SNEAK,
    YOU_SNEAK,
  ].join('|')

  SNEAK_SUCCESS_PATTERN = [
    YOU_SNEAK,
  ].join('|')

  STAND_PATTERN = [
    CANNOT_MANAGE_TO_STAND,
    YOU_ARE_ALREADY_STANDING,
    YOU_STAND,
  ].join('|')

  STAND_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_STANDING,
    YOU_STAND,
  ].join('|')

  STEAL_PATTERN = [
    ATTEMPTING_TO_AVOID_THE_NOTICE,
    MOVING_STEALTHY_YOU_MANAGE,
    YOU_CANT_STEAL_THAT,
    YOU_NEED_AT_LEAST_ONE_HAND_FREE,
  ].join('|')

  STEAL_SUCCESS_PATTERN = [
    MOVING_STEALTHY_YOU_MANAGE,
  ].join('|')

  STORE_MY_PATTERN = [
    WHAT_WERE_YOU,
    YOU_PUT_YOUR,
  ].join('|')

  STORE_MY_SUCCESS_PATTERN = [
    YOU_PUT_YOUR,
  ].join('|')

  TARGET_PATTERN = [
    THERE_IS_NOTHING_ELSE,
    YOUR_PATTERN_DISSIPATES,
    YOUR_TARGET_PATTERN_DISSIPATES,
    YOUR_TARGET_PATTERN_IS,
    YOU_BEGIN_TO_WEAVE,
    YOU_DONT_HAVE_A_SPELL,
    YOU_MUST_BE_PREPARING_A_SPELL,
  ].join('|')

  TARGET_SUCCESS_PATTERN = [
    YOUR_TARGET_PATTERN_IS,
    YOU_BEGIN_TO_WEAVE,
  ].join('|')

  UNHIDE_PATTERN = [
    YOU_ARE_NOT_HIDDEN,
    YOU_COME_OUT,
  ].join('|')

  UNHIDE_SUCCESS_PATTERN = [
    YOU_ARE_NOT_HIDDEN,
    YOU_COME_OUT,
  ].join('|')

  WEAR_MY_PATTERN = [
    ONTO_YOUR_HANDS,
    WEAR_WHAT,
    YOU_ARE_ALREADY,
    YOU_ATTACH_A,
    YOU_ATTACH_SOME,
    YOU_PUT_A,
    YOU_SLIDE_YOUR,
    YOU_SLING_A,
    YOU_WORK_YOUR_WAY,
  ].join('|')

  WEAR_MY_SUCCESS_PATTERN = [
    ONTO_YOUR_HANDS,
    YOU_ARE_ALREADY,
    YOU_ATTACH_A,
    YOU_ATTACH_SOME,
    YOU_PUT_A,
    YOU_SLIDE_YOUR,
    YOU_SLING_A,
    YOU_WORK_YOUR_WAY,
  ].join('|')

  protected

  def cast(target=nil)
    wait_for_match(
      CAST_PATTERN,
      "cast #{target}".rstrip
    ).match(CAST_SUCCESS_PATTERN)
  end

  def close_my(item)
    wait_for_match(
      CLOSE_MY_PATTERN,
      "close my #{item}"
    ).match(CLOSE_MY_SUCCESS_PATTERN)
  end

  def charge_my(item, mana)
    wait_for_match(
      CHARGE_MY_PATTERN,
      "charge my #{item} #{mana}"
    ).match(CHARGE_MY_SUCCESS_PATTERN)
  end

  def dead_creature?
    wait_for_match(
      DEAD_CREATURE_PATTERN,
      'look'
    ).match(DEAD_CREATURE_SUCCESS_PATTERN)
  end

  def drop_my(item)
    wait_for_match(
      DROP_MY_PATTERN,
      "drop my #{item}"
    ).match(DROP_MY_SUCCESS_PATTERN)
  end

  def empty_left
    wait_for_match(
      EMPTY_LEFT_PATTERN,
      'empty left'
    ).match(EMPTY_LEFT_SUCCESS_PATTERN)
  end

  def empty_right
    wait_for_match(
      EMPTY_RIGHT_PATTERN,
      'empty right'
    ).match(EMPTY_RIGHT_SUCCESS_PATTERN)
  end

  def get(item, container=nil)
    wait_for_match(
      GET_PATTERN,
      container ? "get #{item} from #{container}" : "get #{item}"
    ).match(GET_SUCCESS_PATTERN)
  end

  def get_my(item, container=nil)
    wait_for_match(
      GET_MY_PATTERN,
      container ? "get my #{item} from my #{container}" : "get my #{item}"
    ).match(GET_MY_SUCCESS_PATTERN)
  end

  def hide
    wait_for_match(
      HIDE_PATTERN,
      'hide',
    ).match(HIDE_SUCCESS_PATTERN)
  end

  def invoke_my(item)
    wait_for_match(
      INVOKE_MY_PATTERN,
      "invoke my #{item}"
    ).match(INVOKE_MY_SUCCESS_PATTERN)
  end

  def kneel
    wait_for_match(
      KNEEL_PATTERN,
      'kneel'
    ).match(KNEEL_SUCCESS_PATTERN)
  end

  def lie
    wait_for_match(
      LIE_PATTERN,
      'lie'
    ).match(LIE_SUCCESS_PATTERN)
  end

  def look
    wait_for_match(
      LOOK_PATTERN,
      'look',
    ).match(LOOK_SUCCESS_PATTERN)
  end

  def loot(loot_type)
    wait_for_match(
      LOOT_PATTERN,
      "loot #{loot_type}".rstrip
    ).match(LOOT_SUCCESS_PATTERN)
  end

  def move(direction)
    loop do
      result = wait_for_match(
        MOVE_PATTERN,
        direction
      )
      case result
        when \
          OBVIOUS_EXITS,
          OBVIOUS_PATHS
          return true
        when \
          YOU_TRY_TO_MOVE_BUT_YOURE_ENGAGED
          sleep 0.1 until retreat
        else
          return false
      end
    end
  end

  def open_my(item)
    wait_for_match(
      OPEN_MY_PATTERN,
      "open my #{item}"
    ).match(OPEN_MY_SUCCESS_PATTERN)
  end

  def prep(spell, mana=nil)
    wait_for_match(
      PREP_PATTERN,
      mana ? "prep #{spell} #{mana}" : "prep #{spell}"
    ).match(PREP_SUCCESS_PATTERN)
  end

  def release
    wait_for_match(
      RELEASE_PATTERN,
      'release'
    ).match(RELEASE_SUCCESS_PATTERN)
  end

  def remove_my(item)
    wait_for_match(
      REMOVE_MY_PATTERN,
      "remove my #{item}"
    ).match(REMOVE_MY_SUCCESS_PATTERN)
  end

  def retreat
    wait_for_match(
      RETREAT_PATTERN,
      'retreat'
    ).match(RETREAT_SUCCESS_PATTERN)
  end

  def sell_my(item)
    wait_for_match(
      SELL_MY_PATTERN,
      "sell my #{item}"
    ).match(SELL_MY_SUCCESS_PATTERN)
  end

  def sit
    wait_for_match(
      SIT_PATTERN,
      'sit'
    ).match(SIT_SUCCESS_PATTERN)
  end

  def sneak(direction)
    wait_for_match(
      SNEAK_PATTERN,
      "sneak #{direction}"
    ).match(SNEAK_SUCCESS_PATTERN)
  end

  def stand
    wait_for_match(
      STAND_PATTERN,
      'stand'
    ).match(STAND_SUCCESS_PATTERN)
  end

  def steal(target, target_location=nil)
    wait_for_match(
      STEAL_PATTERN,
      target_location.present? ? "steal #{target} from #{target_location}" : \
        "steal #{target}"
    ).match(STEAL_SUCCESS_PATTERN)
  end

  def store_my(item, container)
    wait_for_match(
      STORE_MY_PATTERN,
      "put my #{item} in my #{container}"
    ).match(STORE_MY_SUCCESS_PATTERN)
  end

  def target
    wait_for_match(
      TARGET_PATTERN,
      'target'
    ).match(TARGET_SUCCESS_PATTERN)
  end

  def unhide
    wait_for_match(
      UNHIDE_PATTERN,
      'unhide',
    ).match(UNHIDE_SUCCESS_PATTERN)
  end

  def wear_my(item)
    wait_for_match(
      WEAR_MY_PATTERN,
      "wear my #{item}"
    ).match(WEAR_MY_SUCCESS_PATTERN)
  end
end
