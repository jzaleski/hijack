require 'hijack/script/base_script'

class SliceScript < BaseScript

  def run(args)
    loop do
      puts 'feint'
      sleep 2.5
      puts 'slice'
      sleep 3.5
      puts 'draw'
      sleep 3.5
      puts 'chop'
      sleep 4.5
      waiting_for_callback = true
      @bridge.callback_manager.add_match(
        'You feel fully rested.',
        lambda {waiting_for_callback = false}
      )
      sleep 0.5 while waiting_for_callback
    end
  end

end
