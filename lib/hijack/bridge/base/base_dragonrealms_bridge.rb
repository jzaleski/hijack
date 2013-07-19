require 'hijack/bridge/base/base_simutronics_bridge'

class BaseDragonrealmsBridge < BaseSimutronicsBridge

  def gets
    # strip leading/trailing carriage return characters
    line = super.chomp
    # ensure that lines w/ bold characters switch back to normal-text
    line << "\e[0m" if line.include?('***')
    # append a new-line before returning to the caller
    "#{line}\n"
  end

end
