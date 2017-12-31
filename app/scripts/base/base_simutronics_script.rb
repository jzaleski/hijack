load "#{SCRIPTS_DIR}/base/base_script.rb", true

class BaseSimutronicsScript < BaseScript
  SORRY_YOU_MAY_ONLY_TYPE_AHEAD = 'Sorry, you may only type ahead'
  WAIT = '\.\.\.wait '
  WAIT_N_SECONDS = 'Wait \d+ second[s]?'

  RETRY_PATTERN = [
    SORRY_YOU_MAY_ONLY_TYPE_AHEAD,
    WAIT,
    WAIT_N_SECONDS,
  ].join('|')

  protected

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
      # sleep before retrying, add a little entropy to ensure that all retries
      # don't occur at exactly the same time
      sleep 0.1 + rand(0..0.5)
    end
  end
end
