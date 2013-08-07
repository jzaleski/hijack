require 'hijack/script/base/base_script'

class BaseDragonrealmsScript < BaseScript

  ALREADY_PREPARED = 'You have already fully'
  ATTEMPT_TO_CHANNEL = 'attempt to channel'
  FORGE_A_MAGICAL_LINK = 'forge a magical link'
  INVOKE_WHAT = 'Invoke what\?'
  IN_ROUNDTIME = '...wait'
  IS_INTACT = 'is intact\.'
  I_COULD_NOT_FIND = 'I could not find'
  NO_IDEA_HOW = 'no idea how'
  NO_SPELL = "You don't have a spell prepared"
  PREPARING_SPELL = 'You raise an'
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already'
  WHAT_WERE_YOU = 'What were you'
  YOU_CANT_CLOSE = "You can't close"
  YOU_CANT_OPEN = "You can't open"
  YOU_CLOSE_YOUR = 'You close your'
  YOU_GESTURE = 'You gesture'
  YOU_OPEN_YOUR = 'You open your'
  YOU_PUT_YOUR = 'You put your'

  CAST_PATTERN = [
    NO_SPELL,
    YOU_GESTURE,
  ].join('|')

  CAST_SUCCESSES = [
    YOU_GESTURE,
  ]

  CHARGE_PATTERN = [
    ATTEMPT_TO_CHANNEL,
    I_COULD_NOT_FIND,
  ].join('|')

  CHARGE_SUCCESSES = [
    ATTEMPT_TO_CHANNEL,
  ]

  CLOSE_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    WHAT_WERE_YOU,
    YOU_CANT_CLOSE,
    YOU_CLOSE_YOUR,
  ].join('|')

  CLOSE_SUCCESSES = [
    THAT_IS_ALREADY_CLOSED,
    YOU_CLOSE_YOUR,
  ]

  INVOKE_PATTERN = [
    FORGE_A_MAGICAL_LINK,
    INVOKE_WHAT,
    IS_INTACT,
  ].join('|')

  INVOKE_SUCCESSES = [
    FORGE_A_MAGICAL_LINK,
    IS_INTACT,
  ]

  OPEN_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    WHAT_WERE_YOU,
    YOU_CANT_OPEN,
    YOU_OPEN_YOUR,
  ].join('|')

  OPEN_SUCCESSES = [
    THAT_IS_ALREADY_OPEN,
    YOU_OPEN_YOUR,
  ]

  PREP_PATTERN = [
    ALREADY_PREPARED,
    NO_IDEA_HOW,
    PREPARING_SPELL,
  ].join('|')

  PREP_SUCCESSES = [
    ALREADY_PREPARED,
    PREPARING_SPELL,
  ]

  STORE_PATTERN = [
    WHAT_WERE_YOU,
    YOU_PUT_YOUR,
  ].join('|')

  STORE_SUCESSES = [
    YOU_PUT_YOUR,
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
    CLOSE_SUCCESSES.include?(
      wait_for_match(
        CLOSE_PATTERN,
        "close my #{item}"
      )
    )
  end

  def charge_my(item, mana)
    CHARGE_SUCCESSES.include?(
      wait_for_match(
        CHARGE_PATTERN,
        "charge my #{item} #{mana}"
      )
    )
  end

  def invoke_my(item)
    INVOKE_SUCCESSES.include?(
      wait_for_match(
        INVOKE_PATTERN,
        "invoke my #{item}"
      )
    )
  end

  def open_my(item)
    OPEN_SUCCESSES.include?(
      wait_for_match(
        OPEN_PATTERN,
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

  def store_my(item, container)
    STORE_SUCESSES.include?(
      wait_for_match(
        STORE_PATTERN,
        "put my #{item} in my #{container}"
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
