require 'hijack/script/base/base_script'

class BaseDragonrealmsScript < BaseScript

  IN_ROUNDTIME = '...wait'

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
