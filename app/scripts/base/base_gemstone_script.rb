require 'scripts/base/base_simutronics_script'

class BaseGemstoneScript < BaseSimutronicsScript

  GET_WHAT = 'Get what\?'
  I_COULD_NOT_FIND = 'I could not find'
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already open'
  THERE_DOESNT_SEEM_TO_BE = "There doesn't seem to be"
  WHAT_WERE_YOU = 'What were you'
  YOU_ALREADY_HAVE_THAT = 'You already have that'
  YOU_ARE_NOT_HOLDING_THAT = 'You are not holding that'
  YOU_CLOSE = 'You close'
  YOU_DROP = 'You drop'
  YOU_OPEN = 'You open'
  YOU_PICK_UP = 'You pick up'
  YOU_PUT = 'You put'
  YOU_GET = 'You get'
  YOU_NEED_A_FREE_HAND = 'You need a free hand'
  YOU_REMOVE = 'You remove'

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

  STORE_MY_PATTERN = [
    I_COULD_NOT_FIND,
    YOU_PUT,
  ].join('|')

  STORE_MY_SUCCESS_PATTERN = [
    YOU_PUT,
  ].join('|')

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

  def open_my(item)
    wait_for_match(
      OPEN_MY_PATTERN,
      "open my #{item}"
    ).match(OPEN_MY_SUCCESS_PATTERN)
  end

  def store_my(item, container)
    wait_for_match(
      STORE_MY_PATTERN,
      "put my #{item} in my #{container}"
    ).match(STORE_MY_SUCCESS_PATTERN)
  end

end
