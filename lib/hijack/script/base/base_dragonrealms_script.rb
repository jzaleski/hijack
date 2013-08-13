require 'hijack/script/base/base_script'

class BaseDragonrealmsScript < BaseScript

  ATTEMPT_TO_CHANNEL = 'attempt to channel'
  BUT_YOU_ARENT_HOLDING_THAT = "But you aren't holding that"
  DEAD = '\(dead\)'
  FORGE_A_MAGICAL_LINK = 'forge a magical link'
  FROM_YOUR_HANDS = 'from your hands'
  INVOKE_WHAT = 'Invoke what\?'
  IN_ROUNDTIME = '...wait'
  IS_INTACT = 'is intact\.'
  I_COULD_NOT_FIND = 'I could not find'
  NO_IDEA_HOW = 'no idea how'
  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'
  ONTO_YOUR_HANDS = 'onto your hands'
  REMOVE_WHAT = 'Remove what\?'
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already'
  THEN_HANDS_YOU = 'then hands you'
  THERE_IS_NOTHING_ELSE = 'There is nothing else'
  THERE_IS_NO_MERCHANT = 'There is no merchant'
  TRIES_TO_FIND = 'tries to find'
  WEAR_WHAT = 'Wear what\?'
  WHAT_WERE_YOU = 'What were you'
  WHICH_APPEARS_DEAD = 'which appears dead'
  YOUR_LEFT_HAND_IS_ALREADY_EMPTY = 'Your left hand is already empty'
  YOUR_PATTERN_DISSIPATES = 'Your pattern dissipates'
  YOUR_RIGHT_HAND_IS_ALREADY_EMPTY = 'Your right hand is already empty'
  YOUR_TARGET_PATTERN_DISSIPATES = 'Your target pattern dissipates'
  YOUR_TARGET_PATTERN_IS = 'Your target pattern is'
  YOU_ARENT_PREPARING = "You aren't preparing"
  YOU_ARENT_WEARING_THAT = "You aren't wearing that"
  YOU_ARE_ALREADY = 'You are already'
  YOU_ATTACH_A = 'You attach a'
  YOU_BEGIN_TO_WEAVE = 'You begin to weave'
  YOU_CANT_CLOSE = "You can't close"
  YOU_CANT_OPEN = "You can't open"
  YOU_CLOSE_YOUR = 'You close your'
  YOU_DETACH_A = 'You detach a'
  YOU_DONT_HAVE_A_SPELL = "You don't have a spell"
  YOU_DROP = 'You drop'
  YOU_GESTURE = 'You gesture'
  YOU_GET = 'You get'
  YOU_HAVE_ALREADY_FULLY = 'You have already fully'
  YOU_LET_YOUR_CONCENTRATION_LAPSE = 'You let your concentration lapse'
  YOU_LOOSEN_THE_STRAPS = 'You loosen the straps'
  YOU_NEED_A_FREE_HAND = 'You need a free hand'
  YOU_OPEN_YOUR = 'You open your'
  YOU_PICK_UP = 'You pick up'
  YOU_PUT_A = 'You put a'
  YOU_PUT_YOUR = 'You put your'
  YOU_RAISE_AN = 'You raise an'
  YOU_REMOVE_A = 'You remove a'
  YOU_SEARCH = 'You search'
  YOU_SLIDE_YOUR = 'You slide you'
  YOU_SLING_A = 'You sling a'
  YOU_TAKE_A = 'You take a'
  YOU_WORK_YOUR_WAY = 'You work your way'

  CAST_PATTERN = [
    YOU_DONT_HAVE_A_SPELL,
    YOU_GESTURE,
    YOUR_TARGET_PATTERN_DISSIPATES,
  ].join('|')

  CAST_SUCCESSES = [
    YOU_GESTURE,
  ]

  CHARGE_MY_PATTERN = [
    ATTEMPT_TO_CHANNEL,
    I_COULD_NOT_FIND,
  ].join('|')

  CHARGE_MY_SUCCESSES = [
    ATTEMPT_TO_CHANNEL,
  ]

  CLOSE_MY_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    WHAT_WERE_YOU,
    YOU_CANT_CLOSE,
    YOU_CLOSE_YOUR,
  ].join('|')

  CLOSE_MY_SUCCESSES = [
    THAT_IS_ALREADY_CLOSED,
    YOU_CLOSE_YOUR,
  ]

  DEAD_CREATURE_PATTERN = [
    DEAD,
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
    WHICH_APPEARS_DEAD,
  ].join('|')

  DEAD_CREATURE_SUCCESSES = [
    DEAD,
    WHICH_APPEARS_DEAD,
  ]

  DROP_MY_PATTERN = [
    BUT_YOU_ARENT_HOLDING_THAT,
    WHAT_WERE_YOU,
    YOU_DROP,
  ].join('|')

  DROP_MY_SUCCESSES = [
    YOU_DROP,
  ]

  EMPTY_LEFT_PATTERN = [
    YOUR_LEFT_HAND_IS_ALREADY_EMPTY,
    YOU_DROP,
  ].join('|')

  EMPTY_LEFT_SUCCESSES = [
    YOUR_LEFT_HAND_IS_ALREADY_EMPTY,
    YOU_DROP,
  ]

  EMPTY_RIGHT_PATTERN = [
    YOUR_RIGHT_HAND_IS_ALREADY_EMPTY,
    YOU_DROP,
  ].join('|')

  EMPTY_RIGHT_SUCCESSES = [
    YOUR_RIGHT_HAND_IS_ALREADY_EMPTY,
    YOU_DROP,
  ]

  GET_MY_PATTERN = [
    WHAT_WERE_YOU,
    YOU_ARE_ALREADY,
    YOU_NEED_A_FREE_HAND,
    YOU_GET,
  ].join('|')

  GET_MY_SUCCESSES = [
    YOU_ARE_ALREADY,
    YOU_GET,
  ]

  INVOKE_MY_PATTERN = [
    FORGE_A_MAGICAL_LINK,
    INVOKE_WHAT,
    IS_INTACT,
  ].join('|')

  INVOKE_MY_SUCCESSES = [
    FORGE_A_MAGICAL_LINK,
    IS_INTACT,
  ]

  LOOT_PATTERN = [
    I_COULD_NOT_FIND,
    YOU_SEARCH,
  ].join('|')

  LOOT_SUCCESSES = [
    YOU_SEARCH,
  ]

  OPEN_MY_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    WHAT_WERE_YOU,
    YOU_CANT_OPEN,
    YOU_OPEN_YOUR,
  ].join('|')

  OPEN_MY_SUCCESSES = [
    THAT_IS_ALREADY_OPEN,
    YOU_OPEN_YOUR,
  ]

  PREP_PATTERN = [
    NO_IDEA_HOW,
    YOU_HAVE_ALREADY_FULLY,
    YOU_RAISE_AN,
  ].join('|')

  PREP_SUCCESSES = [
    YOU_HAVE_ALREADY_FULLY,
    YOU_RAISE_AN,
  ]

  RELEASE_PATTERN = [
    YOU_ARENT_PREPARING,
    YOU_LET_YOUR_CONCENTRATION_LAPSE,
  ].join('|')

  RELEASE_SUCCESSES = [
    YOU_ARENT_PREPARING,
    YOU_LET_YOUR_CONCENTRATION_LAPSE,
  ]

  REMOVE_MY_PATTERN = [
    FROM_YOUR_HANDS,
    REMOVE_WHAT,
    YOU_ARENT_WEARING_THAT,
    YOU_DETACH_A,
    YOU_LOOSEN_THE_STRAPS,
    YOU_REMOVE_A,
    YOU_SLING_A,
    YOU_TAKE_A,
    YOU_WORK_YOUR_WAY,
  ].join('|')

  REMOVE_MY_SUCCESSES = [
    FROM_YOUR_HANDS,
    YOU_ARENT_WEARING_THAT,
    YOU_DETACH_A,
    YOU_LOOSEN_THE_STRAPS,
    YOU_REMOVE_A,
    YOU_SLING_A,
    YOU_TAKE_A,
    YOU_WORK_YOUR_WAY,
  ]

  SELL_MY_PATTERN = [
    I_COULD_NOT_FIND,
    THEN_HANDS_YOU,
    THERE_IS_NO_MERCHANT,
    TRIES_TO_FIND,
  ].join('|')

  SELL_MY_SUCCESSES = [
    THEN_HANDS_YOU,
  ]

  STORE_MY_PATTERN = [
    WHAT_WERE_YOU,
    YOU_PUT_YOUR,
  ].join('|')

  STORE_MY_SUCESSES = [
    YOU_PUT_YOUR,
  ]

  TARGET_PATTERN = [
    THERE_IS_NOTHING_ELSE,
    YOUR_PATTERN_DISSIPATES,
    YOUR_TARGET_PATTERN_DISSIPATES,
    YOUR_TARGET_PATTERN_IS,
    YOU_BEGIN_TO_WEAVE,
    YOU_DONT_HAVE_A_SPELL,
  ].join('|')

  TARGET_SUCCESSES = [
    YOUR_TARGET_PATTERN_IS,
    YOU_BEGIN_TO_WEAVE,
  ]

  WEAR_MY_PATTERN = [
    ONTO_YOUR_HANDS,
    WEAR_WHAT,
    YOU_ARE_ALREADY,
    YOU_ATTACH_A,
    YOU_PUT_A,
    YOU_SLIDE_YOUR,
    YOU_SLING_A,
    YOU_WORK_YOUR_WAY,
  ].join('|')

  WEAR_MY_SUCCESSES = [
    ONTO_YOUR_HANDS,
    YOU_ARE_ALREADY,
    YOU_ATTACH_A,
    YOU_PUT_A,
    YOU_SLIDE_YOUR,
    YOU_SLING_A,
    YOU_WORK_YOUR_WAY,
  ]

  protected

  def cast
    CAST_SUCCESSES.include?(
      wait_for_match(
        CAST_PATTERN,
        'cast'
      )
    )
  end

  def close_my(item)
    CLOSE_MY_SUCCESSES.include?(
      wait_for_match(
        CLOSE_MY_PATTERN,
        "close my #{item}"
      )
    )
  end

  def charge_my(item, mana)
    CHARGE_MY_SUCCESSES.include?(
      wait_for_match(
        CHARGE_MY_PATTERN,
        "charge my #{item} #{mana}"
      )
    )
  end

  def dead_creature?
    DEAD_CREATURE_SUCCESSES.include?(
      wait_for_match(
        DEAD_CREATURE_PATTERN,
        'look'
      )
    )
  end

  def drop_my(item)
    DROP_MY_SUCCESSES.include?(
      wait_for_match(
        DROP_MY_PATTERN,
        "drop my #{item}"
      )
    )
  end

  def empty_left
    EMPTY_LEFT_SUCCESSES.include?(
      wait_for_match(
        EMPTY_LEFT_PATTERN,
        'empty left'
      )
    )
  end

  def empty_right
    EMPTY_RIGHT_SUCCESSES.include?(
      wait_for_match(
        EMPTY_RIGHT_PATTERN,
        'empty right'
      )
    )
  end

  def get_my(item, container)
    GET_MY_SUCCESSES.include?(
      wait_for_match(
        GET_MY_PATTERN,
        "get my #{item} from my #{container}"
      )
    )
  end

  def invoke_my(item)
    INVOKE_MY_SUCCESSES.include?(
      wait_for_match(
        INVOKE_MY_PATTERN,
        "invoke my #{item}"
      )
    )
  end

  def loot(loot_type)
    LOOT_SUCCESSES.include?(
      wait_for_match(
        LOOT_PATTERN,
        "loot #{loot_type}".rstrip
      )
    )
  end

  def open_my(item)
    OPEN_MY_SUCCESSES.include?(
      wait_for_match(
        OPEN_MY_PATTERN,
        "open my #{item}"
      )
    )
  end

  def prep(spell, mana=nil)
    PREP_SUCCESSES.include?(
      wait_for_match(
        PREP_PATTERN,
        "prep #{spell} #{mana}".rstrip
      )
    )
  end

  def release
    RELEASE_SUCCESSES.include?(
      wait_for_match(
        RELEASE_PATTERN,
        'release'
      )
    )
  end

  def remove_my(item)
    REMOVE_MY_SUCCESSES.include?(
      wait_for_match(
        REMOVE_MY_PATTERN,
        "remove my #{item}"
      )
    )
  end

  def sell_my(item)
    SELL_MY_SUCCESSES.include?(
      wait_for_match(
        SELL_MY_PATTERN,
        "sell my #{item}"
      )
    )
  end

  def store_my(item, container)
    STORE_MY_SUCESSES.include?(
      wait_for_match(
        STORE_MY_PATTERN,
        "put my #{item} in my #{container}"
      )
    )
  end

  def target
    TARGET_SUCCESSES.include?(
      wait_for_match(
        TARGET_PATTERN,
        'target'
      )
    )
  end

  def wear_my(item)
    WEAR_MY_SUCCESSES.include?(
      wait_for_match(
        WEAR_MY_PATTERN,
        "wear my #{item}"
      )
    )
  end

  def wait_for_match(pattern, command=nil)
    # retry on roundtime if the pattern doesn't already include a match to do so
    should_handle_roundtime = false
    unless pattern.include?(IN_ROUNDTIME)
      pattern = "#{IN_ROUNDTIME}|#{pattern}"
      should_handle_roundtime = true
    end
    # most times, this loop will exit in one or few iterations
    loop do
      match = super(pattern, command)
      if match == IN_ROUNDTIME && should_handle_roundtime
        sleep 1
        next
      end
      return match
    end
  end

end

