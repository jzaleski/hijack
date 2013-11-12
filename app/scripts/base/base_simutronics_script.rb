require 'scripts/base/base_script'

class BaseSimutronicsScript < BaseScript

  SORRY_YOU_MAY_ONLY_TYPE_AHEAD = 'Sorry, you may only type ahead'
  WAIT = '\.\.\.wait'

  RETRY_PATTERN = [
    SORRY_YOU_MAY_ONLY_TYPE_AHEAD,
    WAIT,
  ].join('|')

  def wait_for_match(pattern, command=nil)
    # handle retries because of roundtime or type-aheads here, most times, this
    # loop will exit in one or few iterations
    loop do
      result = super(
        "#{pattern}|#{RETRY_PATTERN}",
        command
      )
      # success
      return result if result.match(pattern)
      # sleep before retrying
      sleep 1
    end
  end

end
