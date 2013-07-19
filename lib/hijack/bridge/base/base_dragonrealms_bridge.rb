require 'hijack/bridge/base/base_simutronics_bridge'

class BaseDragonrealmsBridge < BaseSimutronicsBridge

  PROBLEM_PATTERNS = [
    '***',
    'Log-on system converted',
  ]

  def gets
    # strip leading/trailing carriage return characters
    line = super.chomp
    # ensure that lines matching any of the problem patterns a switch back to
    # normal (non-bold) text
    line << "\e[0m" if PROBLEM_PATTERNS.any? {|pattern| line.include?(pattern)}
    # make sure to append a new-line to the end of the output as it was likely
    # stripped off above
    "#{line}\n"
  end

end
