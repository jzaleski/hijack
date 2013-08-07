require 'hijack/script/base/base_script'

class BaseDragonrealmsScript < BaseScript

  IN_ROUNDTIME = '...wait'
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already'
  WHAT_WERE_YOU = 'What were you'
  YOU_CANT_CLOSE = "You can't close"
  YOU_CANT_OPEN = "You can't open"
  YOU_CLOSE_YOUR = 'You close your'
  YOU_OPEN_YOUR = 'You open your'
  YOU_PUT_YOUR = 'You put your'

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

  STORE_PATTERN = [
    WHAT_WERE_YOU,
    YOU_PUT_YOUR,
  ].join('|')

  STORE_SUCESSES = [
    YOU_PUT_YOUR,
  ]

  protected

  def close_my(item)
    CLOSE_SUCCESSES.include?(
      wait_for_match(
        CLOSE_PATTERN,
        "close my #{item}"
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
