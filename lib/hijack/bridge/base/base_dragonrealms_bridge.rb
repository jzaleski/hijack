require 'hijack/bridge/base/base_simutronics_bridge'

class BaseDragonrealmsBridge < BaseSimutronicsBridge

  WAIT = '\.\.\.wait'

  PROBLEM_PATTERNS = [
    '***',
    'Log-on system converted',
  ]

  def gets
    # strip trailing carriage return characters
    line = super.chomp
    # ensure that lines matching any of the problem patterns a switch back to
    # normal (non-bold) text
    line << "\e[0m" if PROBLEM_PATTERNS.any? {|pattern| line.include?(pattern)}
    # determine whether or not we want to output the line (an empty-string will
    # not be output) and make sure to append a new-line to the end of the output
    # as it was likely stripped off above
    should_output?(line) ? "#{line}\n" : ''
  end

  private

  def should_output?(line)
    !(
      line.match(WAIT) &&
      @config[:silence_roundtime_messages].to_s =~ /\Atrue\Z/
    )
  end

end
