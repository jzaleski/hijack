require 'bridges/base/base_simutronics_bridge'

class BaseDragonrealmsBridge < BaseSimutronicsBridge

  SORRY_YOU_MAY_ONLY_TYPE_AHEAD = 'Sorry, you may only type ahead'
  WAIT = '\.\.\.wait'

  RETRY_PATTERN = [
    SORRY_YOU_MAY_ONLY_TYPE_AHEAD,
    WAIT,
  ].join('|')

  def gets
    # strip trailing "record separator" (typically carriage returns) - this will
    # only remove one instance of a given "record separator" and always returns
    # a new string instance
    line = super.chomp
    # ensure that lines containing bold text switch back to normal (non-bold)
    # text at the end of the line
    line << "\e[0m" if line.match(/\e\[\d+m/)
    # only append a new-line if the string doesn't already end with multiple
    # new-line characters
    line << "\n" unless line.end_with?("\n\n")
    # determine whether or not we want to output the line (an empty-string will
    # not be output) and make sure to append a new-line to the end of the output
    # as it was likely stripped off above
    should_output?(line) ? line : ''
  end

  private

  def should_output?(line)
    !(
      line.match(RETRY_PATTERN) &&
      @config[:silence_retryable_lines] =~ /\Atrue\Z/ &&
      @script_helper.num_running_non_paused > 0
    )
  end

end
