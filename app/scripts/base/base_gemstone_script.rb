require 'scripts/base/base_simutronics_script'

class BaseGemstoneScript < BaseSimutronicsScript

  BEING_FOLLOWED_BY_A_BUNCH = 'Being followed by a bunch'
  CAST_AT_WHAT = 'Cast at what\?'
  FROM_THE_GROUP = 'from the group'
  GET_WHAT = 'Get what\?'
  ISNT_IN_YOUR_GROUP = "isn't in your group"
  IS_ALREADY_A_MEMBER_OF_YOUR_GROUP = 'is already a member of your group'
  I_COULD_NOT_FIND = 'I could not find'
  PREPARED_SPELL_TO_RELEASE = 'prepared spell to release'
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already open'
  THAT_IS_NOT_SOMETHING_YOU_CAN_PREPARE = 'That is not something you can prepare'
  THERE_DOESNT_SEEM_TO_BE = "There doesn't seem to be"
  WHAT_WERE_YOU = 'What were you'
  WHO_DO_YOU_WISH_TO_REMOVE = 'Who do you wish to remove'
  WRING_YOUR_HANDS = 'Wring your hands'
  YOUR_SPELL_IS_READY = 'Your spell is ready'
  YOU_ALREADY_HAVE_A_SPELL_READIED = 'You already have a spell readied'
  YOU_ALREADY_HAVE_THAT = 'You already have that'
  YOU_ARE_NOT_HOLDING_THAT = 'You are not holding that'
  YOU_CLOSE = 'You close'
  YOU_DO_NOT_KNOW_THAT_SPELL = 'You do not know that spell'
  YOU_DONT_HAVE_A_SPELL_PREPARED = "You don't have a spell prepared"
  YOU_DROP = 'You drop'
  YOU_FEEL_THE_MAGIC_OF_YOUR_SPELL = 'You feel the magic of your spell'
  YOU_GESTURE = 'You gesture'
  YOU_GET = 'You get'
  YOU_NEED_A_FREE_HAND = 'You need a free hand'
  YOU_OPEN = 'You open'
  YOU_PICK_UP = 'You pick up'
  YOU_PUT = 'You put'
  YOU_REACH_OUT_AND_HOLD = 'You reach out and hold'
  YOU_REMOVE = 'You remove'
  YOU_WRING_YOUR_HANDS = 'You wring your hands'

  CAST_PATTERN = [
    CAST_AT_WHAT,
    YOU_DONT_HAVE_A_SPELL_PREPARED,
    YOU_GESTURE,
  ].join('|')

  CAST_SUCCESS_PATTERN = [
    YOU_GESTURE,
  ].join('|')

  CLOSE_MY_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    THERE_DOESNT_SEEM_TO_BE,
    WHAT_WERE_YOU,
    YOU_CLOSE,
  ].join('|')

  CLOSE_MY_SUCCESS_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    YOU_CLOSE,
  ].join('|')

  DROP_MY_PATTERN = [
    I_COULD_NOT_FIND,
    YOU_ARE_NOT_HOLDING_THAT,
    YOU_DROP,
  ].join('|')

  DROP_MY_SUCCESS_PATTERN = [
    YOU_DROP,
  ].join('|')

  GET_PATTERN = [
    GET_WHAT,
    YOU_ALREADY_HAVE_THAT,
    YOU_GET,
    YOU_NEED_A_FREE_HAND,
    YOU_PICK_UP,
    YOU_REMOVE,
  ].join('|')

  GET_SUCCESS_PATTERN = [
    YOU_ALREADY_HAVE_THAT,
    YOU_GET,
    YOU_PICK_UP,
    YOU_REMOVE,
  ].join('|')

  GET_MY_PATTERN = [
    GET_WHAT,
    YOU_ALREADY_HAVE_THAT,
    YOU_GET,
    YOU_NEED_A_FREE_HAND,
    YOU_REMOVE,
  ].join('|')

  GET_MY_SUCCESS_PATTERN = [
    YOU_ALREADY_HAVE_THAT,
    YOU_GET,
    YOU_REMOVE,
  ].join('|')

  GROUP_REMOVE_PATTERN = [
    BEING_FOLLOWED_BY_A_BUNCH,
    FROM_THE_GROUP,
    ISNT_IN_YOUR_GROUP,
    WHO_DO_YOU_WISH_TO_REMOVE,
  ].join('|')

  GROUP_REMOVE_SUCCESS_PATTERN = [
    BEING_FOLLOWED_BY_A_BUNCH,
    FROM_THE_GROUP,
    ISNT_IN_YOUR_GROUP,
  ].join('|')

  HOLD_PATTERN = [
    IS_ALREADY_A_MEMBER_OF_YOUR_GROUP,
    WHAT_WERE_YOU,
    WRING_YOUR_HANDS,
    YOU_REACH_OUT_AND_HOLD,
    YOU_WRING_YOUR_HANDS,
  ].join('|')

  HOLD_SUCCESS_PATTERN = [
    IS_ALREADY_A_MEMBER_OF_YOUR_GROUP,
    YOU_REACH_OUT_AND_HOLD,
    YOU_WRING_YOUR_HANDS,
  ].join('|')

  OPEN_MY_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    THERE_DOESNT_SEEM_TO_BE,
    WHAT_WERE_YOU,
    YOU_OPEN,
  ].join('|')

  OPEN_MY_SUCCESS_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    YOU_OPEN,
  ].join('|')

  PREP_PATTERN = [
    THAT_IS_NOT_SOMETHING_YOU_CAN_PREPARE,
    YOUR_SPELL_IS_READY,
    YOU_ALREADY_HAVE_A_SPELL_READIED,
    YOU_DO_NOT_KNOW_THAT_SPELL,
  ].join('|')

  PREP_SUCCESS_PATTERN = [
    YOU_ALREADY_HAVE_A_SPELL_READIED,
    YOUR_SPELL_IS_READY,
  ].join('|')

  RELEASE_PATTERN = [
    PREPARED_SPELL_TO_RELEASE,
    YOU_FEEL_THE_MAGIC_OF_YOUR_SPELL,
  ].join('|')

  RELEASE_SUCCESS_PATTERN = [
    PREPARED_SPELL_TO_RELEASE,
    YOU_FEEL_THE_MAGIC_OF_YOUR_SPELL,
  ].join('|')

  STORE_MY_PATTERN = [
    I_COULD_NOT_FIND,
    YOU_PUT,
  ].join('|')

  STORE_MY_SUCCESS_PATTERN = [
    YOU_PUT,
  ].join('|')

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

  def drop_my(item)
    wait_for_match(
      DROP_MY_PATTERN,
      "drop my #{item}"
    ).match(DROP_MY_SUCCESS_PATTERN)
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

  def group_remove(target)
    wait_for_match(
      GROUP_REMOVE_PATTERN,
      "group remove #{target}".rstrip
    ).match(GROUP_REMOVE_SUCCESS_PATTERN)
  end

  def hold(target)
    wait_for_match(
      HOLD_PATTERN,
      "hold #{target}".rstrip
    ).match(HOLD_SUCCESS_PATTERN)
  end

  def open_my(item)
    wait_for_match(
      OPEN_MY_PATTERN,
      "open my #{item}"
    ).match(OPEN_MY_SUCCESS_PATTERN)
  end

  def prep(spell)
    wait_for_match(
      PREP_PATTERN,
      "prep #{spell}"
    ).match(PREP_SUCCESS_PATTERN)
  end

  def release
    wait_for_match(
      RELEASE_PATTERN,
      'release'
    ).match(RELEASE_SUCCESS_PATTERN)
  end

  def store_my(item, container)
    wait_for_match(
      STORE_MY_PATTERN,
      "put my #{item} in my #{container}"
    ).match(STORE_MY_SUCCESS_PATTERN)
  end

end
