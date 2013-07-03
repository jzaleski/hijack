require 'hijack/script/base_script'

class SliceScript < BaseScript

  def run(args)
    num_iterations = (args[0] || 1).to_i
    1.upto(num_iterations) do |i|
      # combat sequence
      puts 'feint'
      sleep 2.5
      puts 'slice'
      sleep 3.5
      puts 'draw'
      sleep 3.5
      puts 'chop'
      sleep 4.5
      # no need to set the hook and wait for the callback on the final iteration
      if i < num_iterations
        waiting_for_callback = true
        @bridge.callback_manager.add_match(
          'You feel fully rested.',
          lambda {waiting_for_callback = false}
        )
        sleep 0.5 while waiting_for_callback
      end
    end
  end

end
